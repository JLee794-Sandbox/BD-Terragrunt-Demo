# module-azure-subnet

Terraform module to provision a [Subnet](<https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview>).

## Usage

```HCL
module "subnet" {
  source                      = "./../modules/module-azure-subnet"
  name                        = "sneti-rnd-uis-dev-eastus-01"
  resource_group_name         = "rg-uis-dev-eastus-01"
  virtual_network_name        = "vnet-uis-dev-eastus-01"
  address_prefix              = "10.0.1.0/24"
  service_endpoints           = ["Microsoft.Sql","Microsoft.Storage"]
  network_security_group_id   = "/subscriptions/64e92e81-a7c4-4dfb-9664-419c61e71923/resourceGroups/rg-uis-infra-dev-eus-001/providers/Microsoft.Network/networkSecurityGroups/nsgi-uis-infra-dev-eus-001"
}
```

## Module Details

This module creates an Azure Subnet in the specific Virtual Network.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| address\_prefix | Subnet address prefix - 10.0.1.0/24 | string | n/a | yes |
| name | Subnet name | string | n/a | yes |
| resource\_group\_name | Resource group name | string | n/a | yes |
| virtual\_network\_name | Virtual network name | string | n/a | yes |
| network\_security\_group\_id | The ID of the Network Security Group to associate with the subnet. | string | `""` | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| address\_prefix |  |
| id |  |
| name |  |
| resource\_group\_name |  |
| virtual\_network\_name |  |

## Changelog

### v 1.0.0 2020-11-11

* Initial version
