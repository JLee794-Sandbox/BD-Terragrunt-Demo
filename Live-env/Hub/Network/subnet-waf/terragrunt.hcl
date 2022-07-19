# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  source = "${local.module_repository}//module-azure-subnet"
}

dependency "virtual-network" {
  config_path = find_in_parent_folders("virtual-network")
  // config_path = "../virtual-network"

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    name                = "vnet-rnd-uis-dev-eastus-01"
    resource_group_name = "rg-rnd-uis-dev-eastus-01"
    location            = "eastus"
  }
}

dependency "nsg" {
  config_path = "../nsg-waf"

  mock_outputs_allowed_terraform_commands = ["init", "validate"]
  mock_outputs = {
    id                = "mocknsgid"
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  layer_vars       = read_terragrunt_config(find_in_parent_folders("layer.hcl"))
  shared_dependency_vars = read_terragrunt_config(find_in_parent_folders("shared-dependencies.hcl"))
  module_repository = local.common_vars.locals.module_repository
  address_prefixes = local.layer_vars.locals.address_prefixes["waf"]
}

inputs = merge(
  local.shared_dependency_vars.inputs,
  {
    // Override any implicitly passed in variables here
    name = lower(join("", ["snetwaf-", local.shared_dependency_vars.inputs.name]))
    virtual_network_name = dependency.virtual-network.outputs.name
    network_security_group_id = dependency.nsg.outputs.id
    address_prefixes = local.address_prefixes
  }
)
