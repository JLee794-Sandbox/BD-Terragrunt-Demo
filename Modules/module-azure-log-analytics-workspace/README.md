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
