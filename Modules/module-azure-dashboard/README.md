# module-azure-dashboard

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
| [azurerm_dashboard.apps](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dashboard) | resource |
| [azurerm_dashboard.infra](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dashboard) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_gateway_name"></a> [app\_gateway\_name](#input\_app\_gateway\_name) | Application Gateway name | `any` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the AKS cluster to scrape data. | `any` | n/a | yes |
| <a name="input_dashboard_enabled"></a> [dashboard\_enabled](#input\_dashboard\_enabled) | Dashboard enabled flag | `bool` | `false` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Database name | `any` | `null` | no |
| <a name="input_database_server_name"></a> [database\_server\_name](#input\_database\_server\_name) | Database server name | `any` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | The name of the environment / namespace to monitor | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Resource location | `string` | `"eastus"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace to take data from. | `any` | `null` | no |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | The Name of the Log Analytics Workspace to take data from. | `any` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Dashboard to create. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_redis_name"></a> [redis\_name](#input\_redis\_name) | The name of Redis Cache cluster | `any` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to dashboard | `map` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
