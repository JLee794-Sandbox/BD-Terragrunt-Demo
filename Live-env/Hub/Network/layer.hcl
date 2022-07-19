locals {
  # HUB Network Variables
  env_address_space =  {
    dev = ["10.18.0.0/16"]
    stg = ["10.18.0.0/16"]
    prd = ["10.18.0.0/16"]
  }

  env_address_prefixes = {
    dev = {
      waf = ["10.18.18.0/24"]
      bastion = ["10.18.27.0/24"]
    }
    stg = {
      waf = ["10.18.18.0/24"]
      bastion = ["10.18.27.0/24"]
    }
    prd = {
      waf = ["10.18.18.0/24"]
      bastion = ["10.18.27.0/24"]
    }
  }

  environment = get_env("ENV", "dev")
  address_space = local.env_address_space[local.environment]
  address_prefixes = local.env_address_prefixes[local.environment]
}
