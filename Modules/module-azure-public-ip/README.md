# module-azure-public-ip

Terraform module to provision a [Public IP](<https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-ip-addresses-overview-arm#public-ip-addresses>).

## Usage

```HCL
module "public_ip" {
  source                      = "./../modules/module-azure-public-ip"
  name                        = "uis-infra-dev-eus-001"
  location                    = "eastus"
  resource_group_name         = "rg-uis-infra-dev-eus-001"
  sku                         = "Standard"
  tags                        = {
    role = "network"
  }
}
```

## Module Details

This module creates an Azure Public IP that should be assigned to virtual machine or load balancer,etc.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the Public IP | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the Public IP will be created | string | n/a | yes |
| allocation\_method | Defines the allocation method for this IP address. Possible values are Static or Dynamic | string | Static | no |
| sku | The SKU of the Public IP. Accepted values are Basic and Standard | string | Standard | no |
| ip\_version | The IP Version to use, IPv6 or IPv4. Only dynamic IP address allocation is supported for IPv6 | string | IPv4 | no |
| zones | A collection containing the availability zone to allocate the Public IP in. Possible values are Zone-Redundant, 1, 2, 3, and No-Zone. Defaults to Zone-Redundant. | string | n/a | no |
| domain_name_label | Public Ip FQDN | string | n/a | yes |
| tags | A mapping of tags assigned to the Public IP resource | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Public IP |
| id | The ID of the Public IP. |
| location | The supported Azure location where the Public IP exists |
| resource\_group\_name | The name of the resource group in which the Public IP exists |
| allocation\_method | Static or Dynamic allocation method |
| sku | Basic and Standard sku |
| ip\_version | IPv6 or IPv4 version |
| zones | The availability zone where the Public IP is allocated |

## Changelog

### v 1.0.0 2020-11-16

* Initial version
