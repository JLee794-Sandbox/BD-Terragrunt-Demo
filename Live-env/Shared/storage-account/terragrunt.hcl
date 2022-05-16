# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  source = "${local.module_repository}//module-azure-storage-account"
}

include {
  path = find_in_parent_folders()
}

dependency "azure-naming" {
  config_path = find_in_parent_folders("azure-naming")

  skip_outputs = true
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

dependency "subnet-internal" {
  config_path = "../../Network/subnet-internal"


  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    id = "/some/mock/id/here"
    location = "eastus"
  }
}

locals {
  common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  layer_vars       = read_terragrunt_config(find_in_parent_folders("layer.hcl"))

  module_repository = local.common_vars.locals.module_repository
}

# Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
inputs = {
  name = dependency.azure-naming.outputs.name

  resource_group_name = dependency.rg.outputs.name
  location = dependency.rg.outputs.location
  create_storage_account = false
  create_storage_share = false
  container_name         = "provisioning-session-contents"

  virtual_network_subnet_ids = [
    dependency.subnet-internal.outputs.id
    # data.azurerm_subnet.shared.id
    ]
}
