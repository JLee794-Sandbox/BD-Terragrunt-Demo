# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  source = "${local.module_repository}//module-azure-vnet"
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars            = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  shared_dependency_vars = read_terragrunt_config(find_in_parent_folders("shared-dependencies.hcl"))
  module_repository      = local.common_vars.locals.module_repository

}

dependency "hub-vnet" {
  config_path = find_in_parent_folders("Hub/Network/virtual-network")
  // config_path = "../virtual-network"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    name                = "vnet-rnd-uis-dev-eastus-01"
    resource_group_name = "rg-rnd-uis-dev-eastus-01"
    location            = "eastus"
    id                  = "some/resource/id"
  }
}


# Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
inputs = merge(
  local.shared_dependency_vars.inputs,
  {
    name                       = "spoke-${local.shared_dependency_vars.inputs.name}"
    target_vnet_id_for_peering = dependency.hub-vnet.outputs.id
  }
)
