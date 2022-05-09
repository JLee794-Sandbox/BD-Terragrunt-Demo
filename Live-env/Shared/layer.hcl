locals {
  # Network Variables
  env_address_space =  {
    dev = ["10.0.0.0/20"]
    stg = ["10.1.0.0/20"]
    prd = ["10.2.0.0/20"]
  }
  // address_prefixes = {
  //   internal = ["10.0.0.0/24"]
  //   external = ["10.0.7.0/24"]
  // }

  env_address_prefixes = {
    dev = {
      internal = ["10.0.0.0/24"]
      external = ["10.0.7.0/24"]
    }
    stg = {
      internal = ["10.1.0.0/24"]
      external = ["10.1.7.0/24"]
    }
    prd = {
      internal = ["10.2.0.0/24"]
      external = ["10.2.7.0/24"]
    }
  }

  environment = get_env("ENV", "dev")
  address_space = local.env_address_space[local.environment]
  address_prefixes = local.env_address_prefixes[local.environment]
}
