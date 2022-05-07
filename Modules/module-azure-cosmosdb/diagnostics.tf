resource "azurerm_monitor_diagnostic_setting" "cosmosdb" {
  count                          = var.create_cosmos_db ? 1 : 0
  name                           = "${var.name}-ns-diag"
  target_resource_id             = azurerm_cosmosdb_account.main[0].id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = "AzureDiagnostics"

  # For each available log category, check if it should be enabled and set enabled = true if it should.
  # All other categories are created with enabled = false to prevent TF from showing changes happening with each plan/apply.
  # Ref: https://github.com/terraform-providers/terraform-provider-azurerm/issues/7235
  log {
    category = "MongoRequests"
    enabled  = true

    retention_policy {
      enabled = false
      days    = 0
    }
  }


  log {
    category = "GremlinRequests"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "PartitionKeyStatistics"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "ControlPlaneRequests"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "DataPlaneRequests"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "TableApiRequests"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "PartitionKeyRUConsumption"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "QueryRuntimeStatistics"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }

  log {
    category = "CassandraRequests"
    enabled  = false

    retention_policy {
      enabled = false
      days    = 0
    }
  }
  metric {
    category = "Requests"
    enabled  = false

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
