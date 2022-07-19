# module-azure-network-security-group

Terraform module to provision a [Network Security Group](<https://docs.microsoft.com/en-us/azure/virtual-network/security-overview>). A security group will be created with blocked any connections, to allow any inbound or outbound connection, use network_security_group_rule to add needed access.

## Usage

```HCL
module "network_security_group" {
  source                      = "./../modules/module-azure-network-security-group"
  name                        = "nsgi-uis-infra-dev-eus-001"
  location                    = "eastus"
  resource_group_name         = "rg-uis-infra-dev-eus-001"

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

This module creates an Azure Network Security Group to be used for managing inbound or outbound traffic rules for Application Security groups or virtual machines.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the Network Security Group | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the Network Security Group will be created | string | n/a | yes |
| tags | A mapping of tags assigned to the Network Security Group resource | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Network Security Group |
| id | The ID of the Network Security Group. |
| location | The supported Azure location where the Network Security Group exists |
| resource\_group\_name | The name of the resource group in which the Network Security Group exists |

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
| [azurerm_network_security_group.network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.network_security_rule_AllowAzureLoadBalancer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.network_security_rule_AllowGatewayManager](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.network_security_rule_AllowVNetWebInbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.network_security_rule_DenyInternetInBound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Network Security Group location | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Network Security Group name | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Network Security Group resource group name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
