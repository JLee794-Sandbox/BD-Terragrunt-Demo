# azurerm-bastion-service

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
| [azurerm_bastion_host.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_network_security_group.bastionnsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.targetnsgbastionrule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.azurebastionsubnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefix"></a> [address\_prefix](#input\_address\_prefix) | CIDR to assign to the bastion subnet. | `string` | n/a | yes |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | The Public DNS Name being created | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment that is being deployed | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location to deploy resources to. | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the deployment | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources. | `map(string)` | `{}` | no |
| <a name="input_target_nsg_name"></a> [target\_nsg\_name](#input\_target\_nsg\_name) | Name of the NSG to add ingress rule for Bastion to. | `string` | n/a | yes |
| <a name="input_target_subnet_id"></a> [target\_subnet\_id](#input\_target\_subnet\_id) | Subnet ID to associate the Bastion subnet with. | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network the bastion host and subnet will reside in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_dns_name"></a> [bastion\_dns\_name](#output\_bastion\_dns\_name) | n/a |
| <a name="output_bastion_ip_address"></a> [bastion\_ip\_address](#output\_bastion\_ip\_address) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
