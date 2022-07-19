# module-azure-key-vault

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region to deploy to. Recommendation is to set to the same location as the resource group. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Sets which traffic can bypass the network rules. | `string` | `"AzureServices"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. | `string` | `"Deny"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | `"standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of key value pairs for the resource tagging. Default: none. | `map(any)` | `{}` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet ID's which should be able to access this Key Vault. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
