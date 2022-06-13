resource "azurerm_kubernetes_cluster" "aks" {
  name                = lower(join("", ["aks-", format("%v", var.name)]))
resource_group_name = var.resource_group_name
location            = var.location
dns_prefix          = var.dns_prefix
kubernetes_version  = var.kubernetes_version
node_resource_group = lower(join("", ["rg-", format("%v", var.name), "-aks"]))

        default_node_pool {
          name                 = var.pool_name
          node_count           = var.node_count
          orchestrator_version = var.kubernetes_version
          vm_size              = var.vm_size
          availability_zones   = var.availability_zones
          vnet_subnet_id       = var.vnet_subnet_id
          enable_auto_scaling  = var.enable_auto_scaling
          max_count            = var.enable_auto_scaling == "true" ? var.max_count : null
          min_count            = var.enable_auto_scaling == "true" ? var.min_count : null
          tags                 = var.tags

        }

        linux_profile {
          admin_username = var.admin_username

          ssh_key {
            key_data = chomp(azurerm_key_vault_secret.ssh_pub_aks.value)
          }
        }

        addon_profile {
          oms_agent {
            enabled                    = var.oms_agent_enabled
      log_analytics_workspace_id = var.oms_agent_enabled ? var.log_analytics_workspace_id : null
    }
  }

  network_profile {
    network_plugin     = var.network_plugin
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    load_balancer_sku  = "Standard"
    load_balancer_profile {
      outbound_ip_address_ids = [
        azurerm_public_ip.outbound_public_ip.id
      ]
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

  depends_on = [
    azurerm_public_ip.outbound_public_ip
  ]
}
