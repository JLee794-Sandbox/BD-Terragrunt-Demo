<!-- BEGIN_TF_DOCS -->
Terraform module to provision CosmosDB Azure service with MongoDB

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider_azurerm) | n/a |

#### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| <a name="input_location"></a> [location](#input_location) | The Azure Region in which to create resource. | `any` | n/a |
| <a name="input_name"></a> [name](#input_name) | Name of the CosmosDB Account. | `any` | n/a |
| <a name="input_resource_group_name"></a> [resource_group_name](#input_resource_group_name) | Name of resource group to deploy resources in. | `any` | n/a |
| <a name="input_capabilities"></a> [capabilities](#input_capabilities) | Configures the capabilities to enable for this Cosmos DB account. Check README.md for valid values. | `list(string)` | `null` |
| <a name="input_databases"></a> [databases](#input_databases) | List of databases | <pre>map(object({<br>    throughput = number<br>    collections = list(object({<br>      name       = string<br>      shard_key  = string<br>      throughput = number<br>    }))<br>  }))</pre> | `{}` |
| <a name="input_diagnostics"></a> [diagnostics](#input_diagnostics) | Diagnostic settings for those resources that support it. See README.md for details on configuration. | <pre>object({<br>    destination   = string<br>    eventhub_name = string<br>    logs          = list(string)<br>    metrics       = list(string)<br>  })</pre> | `null` |
| <a name="input_ip_range_filter"></a> [ip_range_filter](#input_ip_range_filter) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `string` | `null` |
| <a name="input_is_virtual_network_filter_enabled"></a> [is_virtual_network_filter_enabled](#input_is_virtual_network_filter_enabled) | Enables virtual network filtering for this Cosmos DB account | `bool` | `false` |
| <a name="input_tags"></a> [tags](#input_tags) | Tags to apply to all resources created. | `map(string)` | `{}` |
| <a name="input_virtual_network_rule"></a> [virtual_network_rule](#input_virtual_network_rule) | Specifues a virtual_network_rules resource used to define which subnets are allowed to access this CosmosDB account | <pre>list(object({<br>    id                                   = string,<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `null` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_strings"></a> [connection_strings](#output_connection_strings) | A list of connection strings available for this CosmosDB account. |
| <a name="output_databases"></a> [databases](#output_databases) | A map with database name with the ID for the database |
| <a name="output_endpoint"></a> [endpoint](#output_endpoint) | The endpoint used to connect to the CosmosDB account. |
| <a name="output_id"></a> [id](#output_id) | The ID of the CosmosDB Account. |

<!-- END_TF_DOCS -->
