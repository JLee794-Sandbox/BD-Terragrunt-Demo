# Variables that are common across all environments go here
locals {
  module_repository   = "${get_parent_terragrunt_dir()}/../Modules"
  solution_repository = "${get_parent_terragrunt_dir()}/../Solutions"

  # Commonly shared variables for naming
  business_unit     = "rnd"
  product           = "uis"
  location          = "eastus"
  alteration        = "01"
  cost_center       = "center1"
  const_center_name = "const-center1"
  # environment       = "shared" This will be passed in at the root terragrunt


  # Logic within the root terragrunt.hcl to inject/merge the tags
  tags = {
    business_unit = "MyBusiness",
    owner         = "jinle@microsoft.com",
    provisioner   = "terraform"
  }
}
