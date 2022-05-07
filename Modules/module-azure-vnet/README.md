# module-azure-vnet

Terraform module to provision a [Virtual Network](<https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview>).

## Usage

```HCL
module "virtual_network" {
  source                      = "./../modules/module-azure-vnet"
  name                        = "rnd-uis-dev-eastus-01"
  location                    = "eastus"
  resource_group_name         = "rg-rnd-uis-dev-eastus-01"
  address_space               = ["10.0.0.0/19"]

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

This module creates an Azure Virtual Network.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the Virtual Network | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the Virtual Network will be created | string | n/a | yes |
| address\_space | The address space that is used the virtual network | list | n/a | yes |
| tags | A mapping of tags assigned to the Virtual Network resource | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Virtual Network |
| id | The ID of the Virtual Network. |
| location | The supported Azure location where the Virtual Network exists |
| resource\_group\_name | The name of the resource group in which the Virtual Network exists |
| address\_space | The address space that is used the virtual network |

## Changelog

### v 1.0.0 2020-11-11

* Initial version
