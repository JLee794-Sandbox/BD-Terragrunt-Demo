# Variables specific to the environment go here
locals {
  # Scenario: Deploying to multiple subscriptions with a decentralized backend storage account
  backend_subscription_id             = "7386cd39-b109-4cc6-bb80-bf12413d0a99"
  backend_storage_resource_group_name = "bootstrap"
  backend_storage_account_name        = "bootstrapsadev"

  # AKS Configuration
  dns_service_ip = "10.0.1.10"
  service_cidr =  "10.0.1.0/24"
  docker_bridge_cidr = "10.0.3.0/24"
}
