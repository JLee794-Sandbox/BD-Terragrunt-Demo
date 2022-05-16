output "id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "location" {
  value = azurerm_kubernetes_cluster.aks.location
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].host
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "raw_kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate
}

output "username" {
  value = azurerm_kubernetes_cluster.aks.kube_config[0].username
}

output "identity_principal_id" {
  value = join("", azurerm_kubernetes_cluster.aks.*.identity.0.principal_id)
}

output "outbound_ip_ids" {
  value = azurerm_kubernetes_cluster.aks.network_profile[0].load_balancer_profile[0].effective_outbound_ips
}

output "outbound_ip_address" {
  value = azurerm_public_ip.outbound_public_ip.ip_address
}

output "node_resource_group_id" {
  value = data.azurerm_resource_group.node_resource_group.id
}
