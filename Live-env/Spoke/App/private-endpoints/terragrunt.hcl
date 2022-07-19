# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  source = "${local.module_repository}//azurerm-private-endpoint"
}

include {
  path = find_in_parent_folders()
}

dependency "vnet" {
  config_path = find_in_parent_folders("Spoke/Network/virtual-network")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
    private_fqdn = "rnd-uis-dev-eastus-01.eastus.unity.io"
  }
}

dependency "subnet" {
  config_path = find_in_parent_folders("Spoke/Network/subnet-saas")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}

dependency "key-vault" {
  config_path = "../key-vault"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}
dependency "storage-account" {
  config_path = "../storage-account"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    storage_account_id = "/some/mock/id/here"
  }
}
dependency "sql-server" {
  config_path = "../sql-server"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    sql_server_id = "/some/mock/id/here"
  }
}

dependency "redis" {
  config_path = "../redis"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    redis_id = "/some/mock/id/here"
  }
}


locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  layer_vars       = read_terragrunt_config(find_in_parent_folders("layer.hcl"))
  shared_dependency_vars = read_terragrunt_config(find_in_parent_folders("shared-dependencies.hcl"))

  module_repository = local.common_vars.locals.module_repository
}

# Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
inputs = merge(
  local.shared_dependency_vars.inputs,
  {
    private_endpoints = {
      "kv" = {
        subnet_id                      = dependency.subnet.outputs.id
        private_connection_resource_id = dependency.key-vault.outputs.id
        subresource_names              = [ "vault" ]
        private_dns_zone_name          = dependency.vnet.outputs.private_fqdn
        tags                           = {}
      },
      "storage.blob" = {
        subnet_id                      = dependency.subnet.outputs.id
        private_connection_resource_id = dependency.storage-account.outputs.storage_account_id[0]
        subresource_names              = [ "blob" ]
        private_dns_zone_name          = dependency.vnet.outputs.private_fqdn
        tags                           = {}
      },
      "storage.file" = {
        subnet_id                      = dependency.subnet.outputs.id
        private_connection_resource_id = dependency.storage-account.outputs.storage_account_id[0]
        subresource_names              = [ "file" ]
        private_dns_zone_name          = dependency.vnet.outputs.private_fqdn
        tags                           = {}
      },
      "redis" = {
        subnet_id                      = dependency.subnet.outputs.id
        private_connection_resource_id = dependency.redis.outputs.redis_id
        subresource_names              = [ "redisCache" ]
        private_dns_zone_name          = dependency.vnet.outputs.private_fqdn
        tags                           = {}
      },
      "db" = {
        subnet_id                      = dependency.subnet.outputs.id
        private_connection_resource_id = dependency.sql-server.outputs.sql_server_id
        subresource_names              = [ "sqlServer" ]
        private_dns_zone_name          = dependency.vnet.outputs.private_fqdn
        tags                           = {}
      }
    }
  }
)

#   resource_group_name          = module.resource_group.name
#   availability_zones           = var.availability_zones
#   kubernetes_version           = var.kubernetes_version
#   keyvault_id                  = module.key_vault.vault_id
#   vnet_subnet_id               = module.subnet_internal.id
#   node_count                   = var.aks_node_count
#   service_cidr                 = var.aks_service_cidr
#   dns_service_ip               = var.aks_dns_service_ip
#   docker_bridge_cidr           = var.aks_docker_bridge_cidr
#   oms_agent_enabled            = var.oms_agent_enabled
#   log_analytics_workspace_id   = var.log_analytics_workspace_id
#   tags                         = module.azure_naming.tags
#   depends_on                   = [module.key_vault]
