resource "azurerm_log_analytics_workspace" "workspace" {
  count                      = var.deploy_log_analytics_workspace ? 1 : 0
  name                       = lower(join("", ["log-", format("%v", var.name)]))
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku                        = var.sku_log_analytics_workspace
  retention_in_days          = var.logs_retention_in_days
  tags                       = var.tags
  daily_quota_gb             = var.daily_quota_gb
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
}
