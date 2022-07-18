# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  source = "${local.module_repository}//azurerm-hdinsight-kafka-cluster"
}

include {
  path = find_in_parent_folders()
}

dependency "key-vault" {
  config_path = find_in_parent_folders("Spoke/App/key-vault")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}

locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  shared_dependency_vars = read_terragrunt_config(find_in_parent_folders("shared-dependencies.hcl"))

  module_repository = local.common_vars.locals.module_repository
}

# Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
inputs = merge(
  local.shared_dependency_vars.inputs,
  {
    name = local.shared_dependency_vars.inputs.short_name
    key_vault_id = dependency.key-vault.outputs.id
  }
)
