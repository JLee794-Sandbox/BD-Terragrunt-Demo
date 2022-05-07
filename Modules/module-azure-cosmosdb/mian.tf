locals {

  collections = flatten([
    for db_key, db in var.databases : [
      for col in db.collections : {
        name       = col.name
        database   = db_key
        shard_key  = col.shard_key
        throughput = col.throughput
      }
    ]
  ])

  diag_resource_list = var.diagnostics != null ? split("/", var.diagnostics.destination) : []
  parsed_diag = var.diagnostics != null ? {

    log_analytics_id = var.diagnostics.destination
    log              = var.diagnostics.logs
    } : {
    log_analytics_id = null
    log              = []
  }
}

resource "azurerm_cosmosdb_account" "main" {
  count                = var.create_cosmos_db ? 1 : 0
  name                 = "cosmos-${var.name}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  offer_type           = "Standard"
  kind                 = "MongoDB"
  mongo_server_version = var.mongo_server_version

  enable_automatic_failover = false
  ip_range_filter           = var.ip_range_filter

  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled

  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rule != null ? toset(var.virtual_network_rule) : []
    content {
      id                                   = module.subnet_internal.id
      ignore_missing_vnet_service_endpoint = true
    }
  }

  dynamic "capabilities" {
    for_each = var.capabilities != null ? var.capabilities : []
    content {
      name = capabilities.value
    }
  }

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  tags = var.tags
}

resource "azurerm_cosmosdb_mongo_database" "main" {
  for_each = var.databases

  name                = each.key
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.main[0].name
}

resource "azurerm_cosmosdb_mongo_collection" "main" {
  for_each = { for col in local.collections : col.name => col }

  name                = each.value.name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.main[0].name
  database_name       = each.value.database
  default_ttl_seconds = "0"
  shard_key           = each.value.shard_key
  throughput          = each.value.throughput

  index {
    keys = ["SessionId"]
  }

  lifecycle {
    ignore_changes = [index]
  }

  depends_on = [azurerm_cosmosdb_mongo_database.main]
}
