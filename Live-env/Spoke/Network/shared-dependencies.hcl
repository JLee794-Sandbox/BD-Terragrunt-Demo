dependency "azure-naming" {
  config_path = find_in_parent_folders("Shared/azure-naming")

  # mock_outputs_allowed_terraform_commands = ["validate", "plan", "destroy"]
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

dependency "resource-group" {
  config_path = find_in_parent_folders("Shared/resource-group")

  # mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    location = "eastus"
    name     = "rg-rnd-uis-dev-eastus-01"
  }
}

inputs = {
  resource_group_name = dependency.resource-group.outputs.name
  location            = dependency.resource-group.outputs.location
  name                = dependency.azure-naming.outputs.name
  tags                = dependency.azure-naming.outputs.tags
}
