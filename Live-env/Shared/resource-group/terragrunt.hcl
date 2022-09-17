# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

# We override the terraform block source attribute here just for the QA environment to show how you would deploy a
# different version of the module in a specific environment.
terraform {
  # source = "${local.module_repository}//key-vault?ref=${local.module_repository_version}"
  source = "${local.module_repository}//module-azure-resource-group"
}

dependency "azure-naming" {
  config_path                             = "../azure-naming"
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "plan-all"]
  mock_outputs = {
    name       = "rnd-uis-dev-eastus-01"
    short_name = "rnduisdeus01"
    location   = "eastus"
    tags = {
      "ConstCenterName" = "const-center1"
      "CostCenter"      = "center1"
      "Department"      = "rnd"
      "Environment"     = "dev"
      "Location"        = "eastus"
      "Product"         = "test"
      "business_unit"   = "MyBusiness"
      "owner"           = "jinle@microsoft.com"
      "provisioner"     = "terraform"
    }
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  module_repository = local.common_vars.locals.module_repository
}

inputs = {
  name = dependency.azure-naming.outputs.name
  tags = merge(
    {

    },
    dependency.azure-naming.outputs.tags
  )
}
