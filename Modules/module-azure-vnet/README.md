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
| [azurerm_dns_zone.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_private_dns_zone.private_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_virtual_network.virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Virtual network address space | `list(any)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Virtual network location -	westeurope/eastus | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Virtual network name | `any` | n/a | yes |
| <a name="input_private_domain_name"></a> [private\_domain\_name](#input\_private\_domain\_name) | The name of the Private DNS Zone | `string` | `"bd.local"` | no |
| <a name="input_public_domain_name"></a> [public\_domain\_name](#input\_public\_domain\_name) | The name of the Public DNS Zone | `string` | `""` | no |
| <a name="input_registration_enabled"></a> [registration\_enabled](#input\_registration\_enabled) | Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled | `string` | `"true"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to virtual network | `map(any)` | `{}` | no |
| <a name="input_target_vnet_id_for_peering"></a> [target\_vnet\_id\_for\_peering](#input\_target\_vnet\_id\_for\_peering) | The ID of the virtual network to peer with | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_space"></a> [address\_space](#output\_address\_space) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_private_fqdn"></a> [private\_fqdn](#output\_private\_fqdn) | n/a |
| <a name="output_private_id"></a> [private\_id](#output\_private\_id) | n/a |
| <a name="output_public_id"></a> [public\_id](#output\_public\_id) | n/a |
| <a name="output_public_name_servers"></a> [public\_name\_servers](#output\_public\_name\_servers) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
