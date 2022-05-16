# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# We override the terraform block source attribute here just for the QA environment to show how you would deploy a
# different version of the module in a specific environment.
terraform {
  # source = "${local.module_repository}//key-vault?ref=${local.module_repository_version}"
  source = "${local.module_repository}//module-azure-key-vault"
}

dependency "azure-naming" {
  config_path = find_in_parent_folders("azure-naming")
  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    name = "rnd-uis-dev-eastus-01"
    short_name = "rnduisdeus01"
    location = "eastus"

    tags = {
      "ConstCenterName" = "const-center1"
      "CostCenter" = "center1"
      "Department" = "rnd"
      "Environment" = "dev"
      "Location" = "eastus"
      "Product" = "test"
      "business_unit" = "MyBusiness"
      "owner" = "jinle@microsoft.com"
      "provisioner" = "terraform"
    }
  }
}

dependency "rg" {
  config_path = find_in_parent_folders("resource-group")
  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    name = "rnd-uis-dev-eastus-01"
  }
}

dependency "sa" {
  config_path = find_in_parent_folders("storage-account")
  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    storage_account_id = "/some/mock/id/here"
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  module_repository = local.common_vars.locals.module_repository
}

dependency "subnet-internal" {
  config_path = "../../Network/subnet-internal"

  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}

inputs = {
  key_vault_name      = dependency.azure-naming.outputs.short_name
  location                        = dependency.azure-naming.outputs.location
  resource_group_name             = dependency.rg.outputs.name
  tags = merge(
    {

    },
    dependency.azure-naming.outputs.tags
  )
}
