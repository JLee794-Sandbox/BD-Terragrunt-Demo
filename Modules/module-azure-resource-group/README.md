# module-azure-resource-group

Terraform module to provision a [Resource Group](<https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview#resource-groups>).

## Usage

```HCL
module "resource_group" {
  source                      = "./../module-azure-resource-group"
  name                        = "rnd-uis-dev-eastus-01"
  location                    = "eastus"

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

## Module Details

This module creates an Azure Resource Group to be used to group Azure resources.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the Resource Group ,prefix "rg-" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| tags | A mapping of tags assigned to the Resource Group resource | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Resource Group |
| id | The ID of the Resource Group. |
| location | The supported Azure location where the Resource Group exists |

## Changelog

### v 0.0.1 2020-11-09

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
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
