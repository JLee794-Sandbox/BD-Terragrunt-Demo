# module-azure-aks

Terraform module to provision a [Azure Kubernetes Service](<https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes>).

## Usage

```HCL
module "aks" {
  source                       = "./../module-azure-aks"
  resource_group_name          = "rg-rnd-uis-dev-eastus-01"
  name                         = "rnd-uis-dev-eastus-01"
  location                     = "eastus"
  keyvault_name                = kvrnduisdeus01
  keyvault_resource_group_name = rg-rnd-uis-dev-eastus-01
  vnet_subnet_id               = "/subscriptions/8cc6b0e7-e341-4103-bed6-574d6b298337/resourceGroups/rg-uis-infra-dev-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-uis-infra-dev-eastus-001/subnets/default"

  tags = {
    "Confidentiality" : "private"
    "SLA"             : "24hours"
    "BusinessImpact"  : "Moderate"
    "BusinessProcess" : "Suppor"
    "RevenueImpact"   : "High"
    "ManagedBy"       : "DevOps"
  }
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group where AKS will be located | string | n/a | yes |
| name | The name of the AKS, prefix "aks-" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where AKS will be created. | string | eastus | yes |
| dns_prefix | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | string |uis-dev-001| yes |
| kubernetes_version | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | string | 1.19.3 | no |
| pool_name |  The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created. | string | default | yes |
| node_count | The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count. | string | "1" | no |
| vm_size |The size of the Virtual Machine| string | Standard_DS2_v2 | yes |
| vnet_subnet_id | The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created.NOTE:A Route Table must be configured on this Subnet. | string | n/a | no |
| network_plugin |Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. | string | azure | yes |
| enable_auto_scaling | Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false. | string | false | no |
| max_count | "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | string | 3 | no |
| min_count | The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | string | 1 | no |
| admin_username | The Public SSH Key used to access the cluster. Changing this forces a new resource to be created. | string | bd_admin | no |
| availability_zones | A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | list | null | no |
| service_cidr | Network range used by the Kubernetes service. | string | null | no |
| dns_service_ip | IP address within the Kubernetes service address range used by cluster service discovery (kube-dns). | string | null | no |
| docker_bridge_cidr |  IP address (in CIDR notation) used as the Docker bridge IP address on nodes. | string | null | no |
| keyvault_name |  example: kvuisinfradeus001 - Specifies the name of the Key Vault where SSH key and KEK is stored. | string | n/a | yes |
| keyvault_resource_group_name |  example: rg-uis-infra-dev-eastus-001 - The name of the Resource Group in which the Key Vault exists. | string | n/a | yes |
| oms_agent_enabled | Enable Cluster Monitoring. | string | false | no |
| log_analytics_workspace_id | The ID of the Log Analytics Workspace which the OMS Agent should send data to. | string | null | no |
| node_resource_group | The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created. | string | n/a | no |


## Outputs

| Name | Description |
|------|-------------|
| id | AKS instance id. |
| name | AKS instance name.|
| location | AKS instance location.|
| host | AKS instance host name |
| node_resource_group | Name of the Resource group where the kubernetes nodes should exist.|
| raw_kube_config | Raw Kubernetes config to be used by kubectl and other compatible tools.|
| client_certificate | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.|
| cluster_ca_certificate | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.|
| username | username used to authenticate to the Kubernetes cluster.|
| identity_principal_id | The Principal ID for the Service Principal associated with the Identity of this AKS|
| outbound_ip_ids | Resource IDs of AKS outbound Public IP address|
| outbound_ip_address | Outbound public Ip address of AKS |

## Changelog

### v 1.0.0 2020-11-20

* Initial version

### v 0.0.1 2020-01-20

* Added static outbound IP address

### v 1.0.0 2021-02-22

* Added AddOn Profile block.


### v 1.0.0 2021-03-09

* Fix Aks resources group name.

### v 1.0.0 2021-05-13

* Added node_resource_group output.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.ssh_private_aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_key_vault_secret.ssh_pub_aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_public_ip.outbound_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_role_assignment.subnet_role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [tls_private_key.ssh_aks](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [azurerm_resource_group.node_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The Public SSH Key used to access the cluster. Changing this forces a new resource to be created. | `string` | `"bd_admin"` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | `list(string)` | `null` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | `string` | `"uis-dev-001"` | no |
| <a name="input_dns_service_ip"></a> [dns\_service\_ip](#input\_dns\_service\_ip) | IP address within the Kubernetes service address range used by cluster service discovery (kube-dns). | `any` | `null` | no |
| <a name="input_docker_bridge_cidr"></a> [docker\_bridge\_cidr](#input\_docker\_bridge\_cidr) | IP address (in CIDR notation) used as the Docker bridge IP address on nodes. | `any` | `null` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false. | `string` | `"false"` | no |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | keyvault ID | `any` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | `string` | `"1.19.7"` | no |
| <a name="input_location"></a> [location](#input\_location) | AKS resource location | `string` | `"eastus"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace which the OMS Agent should send data to. | `any` | `null` | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `string` | `"3"` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | `string` | `"1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. | `string` | `"azure"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min\_count and max\_count. | `string` | `"1"` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | AddOn Profile block. | `bool` | `false` | no |
| <a name="input_pool_name"></a> [pool\_name](#input\_pool\_name) | The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created. | `string` | `"default"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_rg_id"></a> [rg\_id](#input\_rg\_id) | n/a | `string` | `""` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | Network range used by the Kubernetes service. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource group | `map` | `{}` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the Virtual Machine | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created.NOTE:A Route Table must be configured on this Subnet. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_identity_principal_id"></a> [identity\_principal\_id](#output\_identity\_principal\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | n/a |
| <a name="output_node_resource_group_id"></a> [node\_resource\_group\_id](#output\_node\_resource\_group\_id) | n/a |
| <a name="output_outbound_ip_address"></a> [outbound\_ip\_address](#output\_outbound\_ip\_address) | n/a |
| <a name="output_outbound_ip_ids"></a> [outbound\_ip\_ids](#output\_outbound\_ip\_ids) | n/a |
| <a name="output_raw_kube_config"></a> [raw\_kube\_config](#output\_raw\_kube\_config) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
