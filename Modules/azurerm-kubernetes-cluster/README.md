# azurerm-kubernetes-cluster

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.aad_pod_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_role_assignment.aks_identity_operator](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aks_vm_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.aks_pod_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
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
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | ID for ingerss app gw | `string` | n/a | yes |
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
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | ID for the private dns zone for private cluster. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_rg_id"></a> [rg\_id](#input\_rg\_id) | n/a | `string` | `""` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | Network range used by the Kubernetes service. | `any` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource group | `map(any)` | `{}` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The size of the Virtual Machine | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created.NOTE:A Route Table must be configured on this Subnet. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aad_pod_identity_client_id"></a> [aad\_pod\_identity\_client\_id](#output\_aad\_pod\_identity\_client\_id) | Client ID for the Managed Identity for AAD Pod Identity |
| <a name="output_aad_pod_identity_resource_id"></a> [aad\_pod\_identity\_resource\_id](#output\_aad\_pod\_identity\_resource\_id) | Resource ID for the Managed Identity for AAD Pod Identity |
| <a name="output_agic_id"></a> [agic\_id](#output\_agic\_id) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_identity_principal_id"></a> [identity\_principal\_id](#output\_identity\_principal\_id) | n/a |
| <a name="output_kubelet_id"></a> [kubelet\_id](#output\_kubelet\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | n/a |
| <a name="output_node_resource_group_id"></a> [node\_resource\_group\_id](#output\_node\_resource\_group\_id) | n/a |
| <a name="output_outbound_ip_ids"></a> [outbound\_ip\_ids](#output\_outbound\_ip\_ids) | n/a |
| <a name="output_raw_kube_config"></a> [raw\_kube\_config](#output\_raw\_kube\_config) | n/a |
| <a name="output_username"></a> [username](#output\_username) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
