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
