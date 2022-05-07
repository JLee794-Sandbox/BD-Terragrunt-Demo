# data "azurerm_resource_group" "resource_group" {
#   name = var.resource_group_name
# }

resource "azurerm_role_assignment" "subnet_role_assignment" {
  scope                = var.rg_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}
