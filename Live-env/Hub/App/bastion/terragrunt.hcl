# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  source = "${local.module_repository}//azurerm-bastion-service"
}

include {
  path = find_in_parent_folders()
}


dependency "target_subnet" {
  config_path = find_in_parent_folders("Spoke/Network/subnet-saas")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}

dependency "target_subnet_nsg" {
  config_path = find_in_parent_folders("Spoke/Network/nsg-saas")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}

dependency "source_vnet" {
  config_path = find_in_parent_folders("Hub/Network/virtual-network")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id   = "/some/mock/id/here"
    name = "somevnet"
  }
}

locals {
  common_vars            = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  shared_dependency_vars = read_terragrunt_config(find_in_parent_folders("shared-dependencies.hcl"))
  environment            = get_env("ENV", "dev")
  module_repository      = local.common_vars.locals.module_repository

  # Reference the `layer.hcl` file in the Network/Hub directory to get subnet CIDR for bastion subnet
  network_layer_vars = read_terragrunt_config(find_in_parent_folders("Hub/Network/layer.hcl"))
  address_prefixes   = local.network_layer_vars.locals.address_prefixes["bastion"]
}

# Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
inputs = merge(
  local.shared_dependency_vars.inputs,
  {
    target_subnet_id = dependency.target_subnet.outputs.id
    target_nsg_name  = dependency.target_subnet_nsg.outputs.name

    vnet_name         = dependency.source_vnet.outputs.name
    domain_name_label = "cxbastion"
    environment       = local.environment
    address_prefix    = local.address_prefixes[0]
  }
)
