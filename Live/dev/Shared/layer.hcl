locals {
  # Network Variables
  address_space =  ["10.0.0.0/20"]
  address_prefixes = {
    internal = ["10.0.0.0/24"]
    external = ["10.0.7.0/24"]
  }
}
