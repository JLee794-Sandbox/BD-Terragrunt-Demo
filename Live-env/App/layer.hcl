locals {
  env_availability_zones = {
    dev = ["1"]
    stg = ["1"]
    prod = ["1", "2", "3"]
  }

  environment = get_env("ENV", "dev")
  availability_zones = local.env_availability_zones[local.environment]
  kubernetes_version = "1.23.5"

  # AKS Configuration located in the environment files (dev.env, stg.env, prod.env)
}
