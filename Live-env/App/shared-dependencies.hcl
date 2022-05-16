dependency "azure-naming" {
  config_path = "../Shared/azure-naming"

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

dependency "resource-group" {
  config_path = "../Shared/resource-group"

  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    location = "eastus"
    id = "/some/mock/id/here"
    name = "rg-rnd-uis-dev-eastus-01"
  }
}

dependency "key-vault" {
  config_path = "../Shared/key-vault"

  mock_outputs_allowed_terraform_commands = ["validate", "init"]
  mock_outputs = {
    id = "/some/mock/id/here"
  }
}


inputs = {
  resource_group_name = dependency.resource-group.outputs.name
  location = dependency.resource-group.outputs.location
  name = dependency.azure-naming.outputs.name
  tags = dependency.azure-naming.outputs.tags

  rg_id = dependency.resource-group.outputs.id
  keyvault_id = dependency.key-vault.outputs.id
}
