// # ---------------------------------------------------------------------------------------------------------------------
// # TERRAGRUNT CONFIGURATION
// # This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
// # maintainable: https://github.com/gruntwork-io/terragrunt
// # ---------------------------------------------------------------------------------------------------------------------
// terraform {
//   source = "${local.module_repository}//module-azure-application-gateway"
// }

// include {
//   path = find_in_parent_folders()
// }

// dependency "hub-vnet" {
//   config_path = find_in_parent_folders("Hub/Network/virtual-network")

//   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
//   mock_outputs = {
//     id = "/some/mock/id/here"
//     private_fqdn = "rnd-uis-dev-eastus-01.eastus.unity.io"
//   }
// }

// dependency "nsg-waf" {
//   config_path = find_in_parent_folders("Hub/Network/nsg-waf")

//   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
//   mock_outputs = {
//     id = "/some/mock/id/here"
//   }
// }
// dependency "subnet-waf" {
//   config_path = find_in_parent_folders("Hub/Network/subnet-waf")

//   mock_outputs_allowed_terraform_commands = ["validate", "plan"]
//   mock_outputs = {
//     id = "/some/mock/id/here"
//   }
// }

// locals {
//   common_vars       = read_terragrunt_config(find_in_parent_folders("common.hcl"))
//   shared_dependency_vars = read_terragrunt_config(find_in_parent_folders("shared-dependencies.hcl"))

//   module_repository = local.common_vars.locals.module_repository
// }

// # Merge hierarchy is dictated bottom-up (meaning latter will overwrite the former)
// inputs = merge(
//   local.shared_dependency_vars.inputs,
//   {
//     waf_enabled = false

//     frontend_ports = [
//       {
//         name = "https"
//         port = 443
//       }
//     ]
//     gateway_ip_configuration_subnet_id = dependency.subnet-waf.outputs.id
//     gateway_ip_configuration_network_security_group_name = dependency.nsg-waf.outputs.id

//     backend_services = [
//     ]

//     backend_address_pool = [
//       {
//         fqdns = dependency.hub-vnet.outputs.private_fqdn
//         name  = "${lower(join("", ["agw-", local.shared_dependency_vars.inputs.name]))}-be-pool"
//       }
//     ]

//     custom_probes = [
//     ]
//   }
// )
