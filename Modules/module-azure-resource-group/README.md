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
