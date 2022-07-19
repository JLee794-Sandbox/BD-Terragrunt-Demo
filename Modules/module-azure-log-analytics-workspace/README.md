# module-azure-log-analytics-workspace

Terraform module to provision a [Log Analytics Workspace ](<https://docs.microsoft.com/en-us/azure/azure-monitor/learn/quick-create-workspace>).

## Usage

```HCL
module "log_analytics_workspace" {
  source                         = "./../modules/module-azure-log-analytics-workspace"
  deploy_log_analytics_workspace = true
  name                           = "log-uis-infra-dev-eastus-001"
  location                       = "eastus"
  resource_group_name            = "rg-uis-infra-dev-eastus-001"
  sku_log_analytics_workspace    = "Free"
  logs_retention_in_days         = 7
  tags                           = tags

}
```

## Module Details

This module:

* Creates a Log Analutics Workspace to store logs from AKS deployments

## NOTES

* The Free SKU has a default daily_quota_gb value of 0.5 (GB).
* The Free SKU has a default logs_retention_in_days value of 7

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| deploy\_log\_analytics\_workspace | Conditional check to deploy workspace | bool | false | yes |
| name | Specifies the name of the Log Analutics Workspace. | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | eastus | yes |
| resource\_group\_name | The name of the resource group in which to create the Log Analutics Workspace. | string | n/a | yes |
| sku\_log\_analytics\_workspace | The Name of the SKU used for this Log Analutics Workspace.  Possible values are either 7 (Free Tier only) or range between 30 and 730. | string | `"Free"` | no |
| logs\_retention\_in\_days  | Specifies retention period in days for storing logs | string | 7 | no |
| daily\_quota\_gb | The workspace daily quota for ingestion in GB. | string | 0.5 | no |
| internet\_ingestion\_enabled | Should the Log Analytics Workflow support ingestion over the Public Internet? | bool | true | no |
| internet\_query\_enabled  | Should the Log Analytics Workflow support querying over the Public Internet? | bool | true | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Log Analutics Workspace |
| id | The ID of the Log Analutics Workspace. |

### v 0.0.1 2021-02-12
* Initial version
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
| [azurerm_log_analytics_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_daily_quota_gb"></a> [daily\_quota\_gb](#input\_daily\_quota\_gb) | The workspace daily quota for ingestion in GB. | `any` | `null` | no |
| <a name="input_deploy_log_analytics_workspace"></a> [deploy\_log\_analytics\_workspace](#input\_deploy\_log\_analytics\_workspace) | If set to True, log\_analytics\_workspace will be deployed within AKS cluster | `bool` | `false` | no |
| <a name="input_internet_ingestion_enabled"></a> [internet\_ingestion\_enabled](#input\_internet\_ingestion\_enabled) | Should the Log Analytics Workflow support ingestion over the Public Internet? | `bool` | `true` | no |
| <a name="input_internet_query_enabled"></a> [internet\_query\_enabled](#input\_internet\_query\_enabled) | Should the Log Analytics Workflow support querying over the Public Internet? | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region in which to create the Virtual Network | `string` | `"eastus2"` | no |
| <a name="input_logs_retention_in_days"></a> [logs\_retention\_in\_days](#input\_logs\_retention\_in\_days) | The retention period for the logs in days | `number` | `30` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the log analytics workspace to create. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which the Virtual Network | `any` | n/a | yes |
| <a name="input_sku_log_analytics_workspace"></a> [sku\_log\_analytics\_workspace](#input\_sku\_log\_analytics\_workspace) | The SKU (pricing level) of the Log Analytics workspace | `string` | `"Free"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
