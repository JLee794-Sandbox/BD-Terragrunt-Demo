# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  # source = "${local.module_repository}//key-vault?ref=${local.module_repository_version}"
  source = "${local.module_repository}//module-azure-naming"
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  layer_vars = read_terragrunt_config(find_in_parent_folders("layer.hcl"))

  module_repository = local.common_vars.locals.module_repository
}

inputs = {
  // See common.hcl for the values passed into the azure naming module
}
