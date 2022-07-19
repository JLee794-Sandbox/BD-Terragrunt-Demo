# module-azure-site-to-site-vpn

Terraform module to provision [Local Network Gateway](<https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal#LocalNetworkGateway>) and [Network Gateway Connection](<https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-howto-site-to-site-resource-manager-portal#CreateConnection>).

## Usage

```HCL
module "site_to_site_vpn" {
  source                                        = "./../modules/module-azure-site-to-site-vpn"
  resource_group_name                           = "rg-rnd-uis-shared-eastus-01"
  location                                      = "eastus"
  name                                          = "confd-rnd-uis-shared-eastus-01"
  local_network_gateway_address                 = "40.115.40.129"
  local_network_gateway_address_space           = "10.107.3.0/27"
  virtual_network_gateway_id                    = "/subscriptions/64e92e81-a7c4-4dfb-9664-419c61e71923/resourceGroups/mss-devops-tst/providers/Microsoft.Network/virtualNetworkGateways/mss-devops-vpn"
  virtual_network_gateway_connection_type       = "IPsec"

  virtual_network_gateway_pre_shared_key        = "confluentd_pre_shared_key"

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

This module creates Local Network Gateway and Network Gateway Connection.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource\_group\_name | The name of the resource group in which resources will be created | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| name | The name of the Local Network Gateway and Virtual Network Gateway Connection| string | n/a | yes |
| local\_network\_gateway\_address | The public IP of the remote network VPN endpoint | string | n/a | yes |
| local\_network\_gateway\_address_space | The address space of the remote network | string | n/a | yes |
| virtual\_network\_gateway\_id | The resource ID of the source Azure Virtual Network Gateway | string | n/a | yes |
| virtual\_network\_gateway\_connection\_type | Network Gateway Connection type. Valid options are IPsec (Site-to-Site), ExpressRoute (ExpressRoute), and Vnet2Vnet (VNet-to-VNet) | string | IPsec | yes |
| virtual\_network\_gateway\_pre\_shared\_key | The shared IPSec key | string | n/a | yes |
| tags | A mapping of tags assigned to the resources | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| local_network_gateway_id | The ID of the Local Network Gateway |
| local_network_gateway_name | The name of the Local Network Gateway |
| location | The supported Azure location where the resources exist |
| resource\_group\_name | The name of the resource group in which the resources exist |
| address\_space | The address space that is used the virtual network |
| local_network_gateway_address | The public IP of the remote network VPN endpoint |
| local_network_gateway_address_space | The address space of the remote network |
| virtual_network_gateway_connection_id | The ID of the Network Gateway Connection |
| virtual_network_gateway_connection_name | The name of the Network Gateway Connection |
| virtual_network_gateway_connection_type | Network Gateway Connection type |

## Changelog

### v 1.0.0 2021-01-15

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
| [azurerm_local_network_gateway.local_network_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/local_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.virtual_network_gateway_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_local_network_gateway_address"></a> [local\_network\_gateway\_address](#input\_local\_network\_gateway\_address) | Public IP address of the local network gateway | `any` | n/a | yes |
| <a name="input_local_network_gateway_address_space"></a> [local\_network\_gateway\_address\_space](#input\_local\_network\_gateway\_address\_space) | Address space of the local network gateway - 10.1.1.0/26 | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Virtual network location -	westeurope/eastus | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Local network gateway name | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources | `map` | `{}` | no |
| <a name="input_virtual_network_gateway_connection_type"></a> [virtual\_network\_gateway\_connection\_type](#input\_virtual\_network\_gateway\_connection\_type) | VPN connection type | `string` | `"IPsec"` | no |
| <a name="input_virtual_network_gateway_id"></a> [virtual\_network\_gateway\_id](#input\_virtual\_network\_gateway\_id) | VPN Gateway ID | `any` | n/a | yes |
| <a name="input_virtual_network_gateway_pre_shared_key"></a> [virtual\_network\_gateway\_pre\_shared\_key](#input\_virtual\_network\_gateway\_pre\_shared\_key) | Connection shared key secret name | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_local_network_gateway_address"></a> [local\_network\_gateway\_address](#output\_local\_network\_gateway\_address) | n/a |
| <a name="output_local_network_gateway_address_space"></a> [local\_network\_gateway\_address\_space](#output\_local\_network\_gateway\_address\_space) | n/a |
| <a name="output_local_network_gateway_id"></a> [local\_network\_gateway\_id](#output\_local\_network\_gateway\_id) | n/a |
| <a name="output_local_network_gateway_name"></a> [local\_network\_gateway\_name](#output\_local\_network\_gateway\_name) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_virtual_network_gateway_connection_id"></a> [virtual\_network\_gateway\_connection\_id](#output\_virtual\_network\_gateway\_connection\_id) | n/a |
| <a name="output_virtual_network_gateway_connection_name"></a> [virtual\_network\_gateway\_connection\_name](#output\_virtual\_network\_gateway\_connection\_name) | n/a |
| <a name="output_virtual_network_gateway_connection_type"></a> [virtual\_network\_gateway\_connection\_type](#output\_virtual\_network\_gateway\_connection\_type) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
