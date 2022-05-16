# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  extra_arguments "plugin_dir" {
    commands = [
        "init",
        "plan",
        "apply",
        "destroy",
        "output"
    ]

    env_vars = {
        TF_PLUGIN_CACHE_DIR = "/tmp/plugins",
    }
  }
}

# Generate an Azure provider block
# TODO: Do further planning on multi-tenant/region scenarios around multiple provider configurations
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}

terraform {
  # NOTE: setting required providers at the terragrunt level
  #        will propagate these versions to ALL modules
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "~> 2.22.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.71.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.0.0"
    }
  }
}
EOF
}

locals {
  # Load the site and environment-level shared values
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  layer_vars = read_terragrunt_config(find_in_parent_folders("layer.hcl"))

  # Load backend configuration from the scoped common.hcl configuration file
  backend_subscription_id             = local.env_vars.locals.backend_subscription_id
  backend_storage_resource_group_name = local.env_vars.locals.backend_storage_resource_group_name
  backend_storage_account_name        = local.env_vars.locals.backend_storage_account_name

  # Set layer based on pathing
  #    Expected Structure: [Layer]/[module to be deployed]/[module child elements]
  layer = lower(regex("^([a-zA-Z-_0-9]+)", path_relative_to_include())[0])

  # Set environment based on the environment variable ENV, default to dev
  environment = get_env("ENV", "dev")
  env_vars = read_terragrunt_config(find_in_parent_folders("${local.environment}.hcl"))

  env_tags = merge(
    can(local.common_vars.locals["tags"]) ? local.common_vars.locals["tags"] : {},
    can(local.env_vars.locals["tags"]) ? local.env_vars.locals["tags"] : {},
    can(local.layer_vars.locals["tags"]) ? local.layer_vars.locals["tags"] : {}
  )
}

# Configure Terragrunt to automatically store tfstate files in an Blob Storage container
remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    subscription_id      = local.backend_subscription_id
    resource_group_name  = local.backend_storage_resource_group_name
    storage_account_name = local.backend_storage_account_name
    container_name       = "tfstate"
    key                  = "bd-terragrunt-demo/${path_relative_to_include()}/${local.environment}/terraform.tfstate"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.common_vars.locals,
  local.env_vars.locals,
  local.layer_vars.locals,
  {
    environment = local.environment,
    layer = local.layer,
    env_tags = local.env_tags, # alternatively, tags = local.env_tags
  }
)
