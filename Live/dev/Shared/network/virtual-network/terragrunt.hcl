# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  source = "${local.module_repository}//module-azure-vnet"
}

// dependency "azure-naming" {
//   config_path = find_in_parent_folders("azure-naming")

//   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
//   mock_outputs = {
//     name = "rnd-uis-dev-eastus-01"
//     short_name = "rnduisdeus01"
//     tags = {
//       "ConstCenterName" = "const-center1"
//       "CostCenter" = "center1"
//       "Department" = "rnd"
//       "Environment" = "dev"
//       "Location" = "eastus"
//       "Product" = "test"
//       "business_unit" = "MyBusiness"
//       "owner" = "jinle@microsoft.com"
//       "provisioner" = "terraform"
//     }
//   }
// }

// dependency "resource-group" {
//   config_path = find_in_parent_folders("resource-group")
//   // config_path = "../resource-group"

//   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
//   mock_outputs = {
//     location = "eastus"
//     name = "rg-rnd-uis-dev-eastus-01"
//   }
// }

include {
  path = find_in_parent_folders()
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
    // Override any implicitly passed in variables here
  }
)
