# module-azure-vnet-peering

Terraform module to provision a [Virtual Network Peering](<https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview>).

## Usage

```HCL
module "virtual_network_peering" {
  source                                     = "./../modules/module-azure-vpn-vnet-peering"
  enabled                                    = true
  vpn_virtual_network_name                   = "vnet-rnd-uis-shared-eastus-01"
  vpn_virtual_network_resource_group_name    = "rg-rnd-uis-shared-eastus-01"

  environment_virtual_network_resource_group_name = "rg-rnd-uis-dev-eastus-01"
  environment_virtual_network_name                = "vnet-rnd-uis-dev-eastus-01"
}
```

## Module Details

This module creates an Azure Virtual Network Peering to hub and spoke networks with gateway transit, which allows resources to access other resources in the linked and remote virtual networks.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enabled | If module enabled  | bool | true | yes |
| vpn\_virtual\_network\_name | VPN Gateway virtual network name | string | n/a | yes |
| vpn\_resource\_group\_name | VPN Gateway virtual network resource group name | string | n/a | yes |
| environment\_virtual\_network\_name | Environment virtual network name | string | n/a | yes |
| environment\_resource\_group\_name | Environment virtual network resource group name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| to_hub_name | The name of the Hub Virtual Network Peering |
| to_spoke_name | The name of the Spoke Virtual Network Peering |
| vpn\_virtual\_network\_id | The ID of the VPN Virtual Network |
| environment\_virtual\_network\_id | The ID of the Environment Virtual Network |

## Changelog

### v 1.0.0 2020-11-24

* Initial version

### v 1.0.1 2021-01-20

* Added module enablement and hub-spoke resources
