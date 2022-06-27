locals {
  # HUB Network Variables
  env_address_space =  {
    dev = ["10.27.0.0/16"]
    stg = ["10.27.0.0/16"]
    prd = ["10.27.0.0/16"]
  }

  env_address_prefixes = {
    dev = {
      aks = ["10.27.27.0/24"]
      aks-ilb = ["10.27.26.0/26"]
      saas = ["10.27.36.0/24"]
    }
    stg = {
  aks = ["10.27.27.0/24"]
      aks-ilb = ["10.27.26.0/26"]
      saas = ["10.27.36.0/24"]
    }
    prd = {
      aks = ["10.27.27.0/24"]
      aks-ilb = ["10.27.26.0/26"]
      saas = ["10.27.36.0/24"]
    }
  }

  environment = get_env("ENV", "dev")
  address_space = local.env_address_space[local.environment]
  address_prefixes = local.env_address_prefixes[local.environment]
}
