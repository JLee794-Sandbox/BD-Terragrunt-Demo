# azurerm-dns-zone

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
| [azurerm_dns_a_record.dns_record](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_a_records"></a> [dns\_a\_records](#input\_dns\_a\_records) | Map of A Records | `map(any)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Virtual network location -	westeurope/eastus | `any` | n/a | yes |
| <a name="input_public_domain_name"></a> [public\_domain\_name](#input\_public\_domain\_name) | The name of the Public DNS Zone | `string` | `"bd.public"` | no |
| <a name="input_registration_enabled"></a> [registration\_enabled](#input\_registration\_enabled) | Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled | `string` | `"true"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to virtual network | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dnz_zone"></a> [dnz\_zone](#output\_dnz\_zone) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
