# module-azure-vpn-gateway

Terraform module to provision a [Virtual Network Gateway](<https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways#whatis>).

## Usage

```HCL
module "vpn_gateway" {
  source               = "./../modules/module-azure-vpn-gateway"
  name                 = "rnd-uis-shared-eastus-01"
  location             = "eastus"
  resource_group_name  = "rg-rnd-uis-shared-eastus-01"
  virtual_network_name = "vnet-vgw-rnd-uis-shared-eastus-01"
  address_prefixes     = ["10.10.3.0/27"]

  virtual_network_gateway_type     = "Vpn"
  virtual_network_gateway_vpn_type = "RouteBased"
  virtual_network_gateway_sku      = "VpnGw3"

  tags = {
    "Confidentiality" : "private"
    "SLA" : "24hours"
    "BusinessImpact" : "Moderate"
    "BusinessProcess" : "Suppor"
    "RevenueImpact" : "High"
    "ManagedBy" : "DevOps"
  }
}
```

## Module Details

This module creates Gateway Subnet, Public IP, Virtual Network Gateway.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group\_name | The name of the resource group in which the Virtual Network is created | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| gateway\_virtual\_network\_name | The name of the Virtual Network where the Gateway Subnet will be created | string | n/a | yes |
| gateway\_address\_prefix | The address space that is used the Gateway Subnet | string | n/a | yes |
| name | The name of the Virtual Network Gateway | string | n/a | yes |
| virtual\_network\_gateway\_type | The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute | string | Vpn | yes |
| virtual\_network\_gateway\_vpn\_type | The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased | string | RouteBased | yes |
| virtual\_network\_gateway\_sku | Configuration of the size and capacity of the Virtual Network Gateway | string | VpnGw3 | yes |
| public\_ip\_allocation\_method | Public IP allocation method | string | Dynamic | no |
| virtual\_network\_gateway\_active\_active | Is Active-Active VPN | bool | false | no |
| virtual\_network\_gateway\_enable\_bgp | Is BGP (Border Gateway Protocol) enabled for connection | bool | false | no |
| virtual\_network\_gateway\_private\_ip\_address\_allocation | Private IP allocation method of Virtual Network Gateway | string | Dynamic | no |
| tags | A mapping of tags assigned to the Virtual Network resource | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| resource\_group\_name | The name of the resource group in which the Virtual Network exists |
| location | The supported Azure location where the Virtual Network exists |
| gateway\_subnet\_id | The ID of the Gateway Subnet |
| gateway\_subnet\_name | The name of the Gateway Subnet |
| gateway\_virtual\_network\_name | The name of the Virtual Network where the Gateway Subnet is created |
| public\_ip\_id | The ID of the Public IP |
| public\_ip\_name | The name of the Public IP |
| public\_ip\_address | The address of the Public IP |
| public\_ip\_allocation\_method | The Public IP allocation method |
| virtual\_network\_gateway\_id | The ID of the Virtual Network Gateway |
| virtual\_network\_gateway\_name | The name of the Virtual Network Gateway |
| virtual\_network\_gateway\_type | The type of the Virtual Network Gateway |
| virtual\_network\_gateway\_vpn\_type | The routing type of the Virtual Network Gateway |
| virtual\_network\_gateway\_sku | Configuration of the size and capacity of the Virtual Network Gateway |

## Changelog

### v 1.0.0 2020-11-24

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
| [azurerm_public_ip.gateway_public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.gateway_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network_gateway.virtual_network_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | Gateway subnet address prefix - 10.0.1.0/27 | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Virtual network location -	westeurope/eastus | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | VPN Gateway name | `any` | n/a | yes |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Public IP allocation method | `string` | `"Static"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Public IP SKU | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Gateway subnet name | `string` | `"GatewaySubnet"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources | `map` | `{}` | no |
| <a name="input_virtual_network_gateway_active_active"></a> [virtual\_network\_gateway\_active\_active](#input\_virtual\_network\_gateway\_active\_active) | Is Active-Active VPN | `bool` | `false` | no |
| <a name="input_virtual_network_gateway_enable_bgp"></a> [virtual\_network\_gateway\_enable\_bgp](#input\_virtual\_network\_gateway\_enable\_bgp) | Is BGP (Border Gateway Protocol) enabled for connection | `bool` | `false` | no |
| <a name="input_virtual_network_gateway_private_ip_address_allocation"></a> [virtual\_network\_gateway\_private\_ip\_address\_allocation](#input\_virtual\_network\_gateway\_private\_ip\_address\_allocation) | Private IP allocation method of gateway | `string` | `"Dynamic"` | no |
| <a name="input_virtual_network_gateway_sku"></a> [virtual\_network\_gateway\_sku](#input\_virtual\_network\_gateway\_sku) | Gateway SKU | `string` | `"VpnGw3"` | no |
| <a name="input_virtual_network_gateway_type"></a> [virtual\_network\_gateway\_type](#input\_virtual\_network\_gateway\_type) | Gateway type | `string` | `"Vpn"` | no |
| <a name="input_virtual_network_gateway_vpn_type"></a> [virtual\_network\_gateway\_vpn\_type](#input\_virtual\_network\_gateway\_vpn\_type) | Gateway VPN type | `string` | `"RouteBased"` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Virtual network name where Gateway subnet is created | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_public_ip_id"></a> [gateway\_public\_ip\_id](#output\_gateway\_public\_ip\_id) | n/a |
| <a name="output_gateway_public_ip_ip_address"></a> [gateway\_public\_ip\_ip\_address](#output\_gateway\_public\_ip\_ip\_address) | n/a |
| <a name="output_gateway_public_ip_name"></a> [gateway\_public\_ip\_name](#output\_gateway\_public\_ip\_name) | n/a |
| <a name="output_gateway_subnet_id"></a> [gateway\_subnet\_id](#output\_gateway\_subnet\_id) | n/a |
| <a name="output_gateway_subnet_name"></a> [gateway\_subnet\_name](#output\_gateway\_subnet\_name) | n/a |
| <a name="output_gateway_virtual_network_name"></a> [gateway\_virtual\_network\_name](#output\_gateway\_virtual\_network\_name) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_virtual_network_gateway_id"></a> [virtual\_network\_gateway\_id](#output\_virtual\_network\_gateway\_id) | n/a |
| <a name="output_virtual_network_gateway_name"></a> [virtual\_network\_gateway\_name](#output\_virtual\_network\_gateway\_name) | n/a |
| <a name="output_virtual_network_gateway_sku"></a> [virtual\_network\_gateway\_sku](#output\_virtual\_network\_gateway\_sku) | n/a |
| <a name="output_virtual_network_gateway_type"></a> [virtual\_network\_gateway\_type](#output\_virtual\_network\_gateway\_type) | n/a |
| <a name="output_virtual_network_gateway_vpn_type"></a> [virtual\_network\_gateway\_vpn\_type](#output\_virtual\_network\_gateway\_vpn\_type) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
