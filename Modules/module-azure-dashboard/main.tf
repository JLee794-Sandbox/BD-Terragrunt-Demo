data "azurerm_subscription" "current" {}

resource "azurerm_dashboard" "infra" {
  count               = var.dashboard_enabled ? 1 : 0
  name                = lower(join("", ["infra-", format("%v", var.name)]))
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  dashboard_properties = templatefile("${path.module}/infra.tpl",
    {
      clusterName = var.cluster_name,
      resource_group_name          = var.resource_group_name,
      sub_id      = data.azurerm_subscription.current.subscription_id,
      workspace_id = var.log_analytics_workspace_id[0],
      redis_name = var.redis_name,
      app_gateway_name = var.app_gateway_name,
      database_name = lower(join("", ["sqldb-", format("%v", var.name), "-db1"])),
      database_server_name = var.database_server_name
  })
}

resource "azurerm_dashboard" "apps" {
  count               = var.dashboard_enabled ? 1 : 0
  name                = lower(join("", ["apps-", format("%v", var.name)]))
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  dashboard_properties = templatefile("${path.module}/apps.tpl",
    {
      clusterName = var.cluster_name,
      resource_group_name          = var.resource_group_name,
      sub_id      = data.azurerm_subscription.current.subscription_id,
      workspace_id = var.log_analytics_workspace_id[0],
      workspace_name = var.log_analytics_workspace_name[0],
      env = var.env
  })
}
