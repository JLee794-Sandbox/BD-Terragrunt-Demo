# data "azurerm_key_vault" "keyvault" {
#   name                = var.keyvault_name
#   resource_group_name = var.keyvault_resource_group_name
# }


data "azurerm_resource_group" "node_resource_group" {
  name       = lower(join("", ["rg-", format("%v", var.name), "-aks"]))
  depends_on = [azurerm_kubernetes_cluster.aks]
}
