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
| [azurerm_cosmosdb_account.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |
| [azurerm_cosmosdb_mongo_collection.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_collection) | resource |
| [azurerm_cosmosdb_mongo_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_mongo_database) | resource |
| [azurerm_monitor_diagnostic_setting.cosmosdb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Configures the capabilities to enable for this Cosmos DB account. Check README.md for valid values. | `list(string)` | `null` | no |
| <a name="input_create_cosmos_db"></a> [create\_cosmos\_db](#input\_create\_cosmos\_db) | Create Cosmos DB | `bool` | `true` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | List of databases | <pre>map(object({<br>    collections = list(object({<br>      name       = string<br>      shard_key  = string<br>      throughput = number<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | Diagnostic settings for those resources that support it. See README.md for details on configuration. | <pre>object({<br>    destination = string<br>    logs        = list(string)<br>  })</pre> | `null` | no |
| <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter) | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. | `string` | `null` | no |
| <a name="input_is_virtual_network_filter_enabled"></a> [is\_virtual\_network\_filter\_enabled](#input\_is\_virtual\_network\_filter\_enabled) | Enables virtual network filtering for this Cosmos DB account | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which to create resource. | `any` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | `"/subscriptions/0e4024d6-f954-443d-9342-7b40c50c5bb5/resourcegroups/rg-rnd-uis-shared-eastus-1/providers/microsoft.operationalinsights/workspaces/log-rnd-uis-shared-eastus-1"` | no |
| <a name="input_mongo_server_version"></a> [mongo\_server\_version](#input\_mongo\_server\_version) | n/a | `string` | `"3.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the CosmosDB Account. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of resource group to deploy resources in. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_rule"></a> [virtual\_network\_rule](#input\_virtual\_network\_rule) | Specifues a virtual\_network\_rules resource used to define which subnets are allowed to access this CosmosDB account | <pre>list(object({<br>    id                                   = string,<br>    ignore_missing_vnet_service_endpoint = bool<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_strings"></a> [connection\_strings](#output\_connection\_strings) | A list of connection strings available for this CosmosDB account. |
| <a name="output_databases"></a> [databases](#output\_databases) | A map with database name with the ID for the database |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint used to connect to the CosmosDB account. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the CosmosDB Account. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
