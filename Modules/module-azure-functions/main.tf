resource "azurerm_function_app" "function_app" {
  count                      = var.create_function ? 1 : 0
  name                       = lower(join("", ["func-ims-", format("%v", var.name)]))
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan[0].id
  storage_account_name       = azurerm_storage_account.storage_account_functions[0].name
  storage_account_access_key = azurerm_storage_account.storage_account_functions[0].primary_access_key
  version                    = var.app_runtime_version
  app_settings               = var.app_settings

  site_config {

    always_on  = var.always_on
    ftps_state = var.ftps_state
    dynamic "ip_restriction" {
      for_each = var.ip_restriction_rules
      content {
        virtual_network_subnet_id = lookup(ip_restriction.value, "virtual_network_subnet_id", null)
        action                    = lookup(ip_restriction.value, "action", null)
        priority                  = lookup(ip_restriction.value, "priority", null)
        name                      = lookup(ip_restriction.value, "name", null)
        ip_address                = lookup(ip_restriction.value, "ip_address", null)
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? ["fake"] : []
    content {
      type = var.identity_type
      # Avoid perpetual changes if SystemAssigned and identity_ids is not null
      identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
    }
  }

  tags = var.tags
}
