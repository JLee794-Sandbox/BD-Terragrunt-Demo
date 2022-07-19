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

# Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
inputs = merge(
  local.shared_dependency_vars.inputs,
  {
    name                = "hub-${local.shared_dependency_vars.inputs.name}"
    private_domain_name = "${local.shared_dependency_vars.inputs.name}.${local.shared_dependency_vars.inputs.location}.unity.io"
    public_domain_name  = "${local.shared_dependency_vars.inputs.name}.${local.shared_dependency_vars.inputs.location}.bd.com"
    // Override any implicitly passed in variables here
  }
)
