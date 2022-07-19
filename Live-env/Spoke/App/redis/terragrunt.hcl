# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  source = "${local.module_repository}//module-azure-redis-cache"
}

include {
  path = find_in_parent_folders()
}

dependency "subnet-saas" {
  config_path = find_in_parent_folders("Spoke/Network/subnet-saas")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}

dependency "sql-server" {
  config_path = find_in_parent_folders("Spoke/App/sql-server")

  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    sql_server_name = "some_server"
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
    server_name = dependency.sql-server.outputs.sql_server_name
    subnet_id = dependency.subnet-saas.outputs.id
  }
)
