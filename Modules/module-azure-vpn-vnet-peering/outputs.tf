output "to_hub_name" {
  value = azurerm_virtual_network_peering.virtual_network_peering_to_hub.*.name
}

output "to_spoke_name" {
  value = azurerm_virtual_network_peering.virtual_network_peering_to_spoke.*.name
}

output "vpn_virtual_network_id" {
  value = data.azurerm_virtual_network.vpn_virtual_network.id
}

output "environment_virtual_network_id" {
  value = data.azurerm_virtual_network.environment_virtual_network.id
}
