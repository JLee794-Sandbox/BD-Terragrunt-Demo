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
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Public Ip allocation method - Static/Dynamic | `string` | `"Static"` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | Public Ip FQDN | `any` | n/a | yes |
| <a name="input_ip_version"></a> [ip\_version](#input\_ip\_version) | The IP Version to use - IPv4/IPv6 | `string` | `"IPv4"` | no |
| <a name="input_location"></a> [location](#input\_location) | Public IP location | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Public IP name | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Public IP resource group name | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Public IP - Basic/Standard | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign | `map` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A collection containing the availability zone to allocate the Public IP in | `string` | `"Zone-Redundant"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_allocation_method"></a> [allocation\_method](#output\_allocation\_method) | n/a |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
| <a name="output_ip_version"></a> [ip\_version](#output\_ip\_version) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_sku"></a> [sku](#output\_sku) | n/a |
| <a name="output_zones"></a> [zones](#output\_zones) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
