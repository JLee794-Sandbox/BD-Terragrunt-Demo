# module-azure-key-vault

Terraform module to provision a [Key Vault](<https://docs.microsoft.com/en-in/azure/key-vault/>).

## Usage

```HCL
module "key_vault" {
  source                      = "./../module-azure-key-vault"
  name                        = "uisinfradeus001"
  location                    = "eastus"
  resource_group_name         = "rg-uis-infra-dev-eastus-001"
  virtual_network_subnet_ids  = ["/subscriptions/0e4024d6-f954-443d-9342-7b40c50c5bb5/resourceGroups/rg-uis-infra-dev-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-uis-infra-dev-eastus-001/subnets/sneti-uis-infra-dev-eastus-001"]
}
```

If needed here is a way to disable soft-delete and/or purge-protection by adding next variables:

```HCL
...
  enable_purge_protection = false
  enable_soft_delete = false
...
```

## Module Details

This module:

* Creates a Azure Key Vault with settings to be use for SSE and ADE encryption
* Sets initial admins (key_vault_admins_object_ids variable).
* Sets initial IP whitlisting for access outside of Azure internal services.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ip\_rules | The list of IP CIRDs to initially grant access to KeyVault | list | ["0.0.0.0/0"] | yes |
| key\_vault\_admins\_object\_ids | Object Ids needing admin access to the Key Vault | list | "00465881-6c91-4442-85a1-66609b5ab444", "00465881-6c91-4442-85a1-66609b5ab444" | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | eastus | yes |
| name | Specifies the name of the Key Vault. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the Key Vault. | string | n/a | yes |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | string | "94c3e67c-9e2d-4800-a6b7-635d97882165" | yes |
| enable\_purge\_protection | The switch to enable purge-protection property for KeyVault | string | `"true"` | no |
| enabled\_for\_deployment | Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | string | `"false"` | no |
| enabled\_for\_disk\_encryption | Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | string | `"true"` | no |
| enabled\_for\_template\_deployment | Azure Resource Manager is permitted to retrieve secrets from the key vault. | string | `"false"` | no |
| key\_vault\_keyreaders\_object\_ids | Object Ids needing Key read access to the Key Vault | list | "84a10e8e-e3f5-4dda-83a6-d1dbaa4af623" | no |
| keyreaders\_vault\_cert\_permissions | Cert Permissions for KeyVault Key Readers | list | `<list>` | no |
| keyreaders\_vault\_key\_permissions | Key Permissions for KeyVault Key Readers | list | `<list>` | no |
| keyreaders\_vault\_secret\_permissions | Secret Permissions for KeyVault Key Readers | list | `<list>` | no |
| network\_acls\_bypass | Sets which traffic can bypass the network rules. | string | `"AzureServices"` | no |
| network\_acls\_default\_action | The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. | string | `"Deny"` | no |
| sku | The Name of the SKU used for this Key Vault. | string | `"standard"` | no |
| tags | A mapping of tags to assign to resource group | map | `<map>` | no |
| vault\_cert\_permissions | Cert Permissions | list | `<list>` | no |
| vault\_key\_permissions | Key Permissions | list | `<list>` | no |
| vault\_secret\_permissions | Secret Permissions | list | `<list>` | no |
| virtual\_network\_subnet\_ids | One or more Subnet ID's which should be able to access this Key Vault. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| vuault_name | The name of the Key Vault |
| vault\_id | The ID of the Key Vault. |
| vault\_uri | The URI of the Key Vault, used for performing operations on keys and secrets. |
| vault_resource_group_name | The resource group name where key vault located |

### v 0.0.1 2020-11-19

* Initial version
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
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_access_policy.admins_key_vault_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_access_policy.keyreaders_key_vault_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_monitor_diagnostic_setting.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_storage_account"></a> [create\_storage\_account](#input\_create\_storage\_account) | Create storage account | `any` | n/a | yes |
| <a name="input_enable_purge_protection"></a> [enable\_purge\_protection](#input\_enable\_purge\_protection) | The switch to enable purge-protection property for KeyVault | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | `string` | `"false"` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `string` | `"true"` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Azure Resource Manager is permitted to retrieve secrets from the key vault. | `string` | `"true"` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | List of whitelisted IP address for HTTPS inbound | `string` | `"0.0.0.0/0"` | no |
| <a name="input_key_vault_admins_object_ids"></a> [key\_vault\_admins\_object\_ids](#input\_key\_vault\_admins\_object\_ids) | Object Ids needing admin access to the Key Vault | `list(string)` | `[]` | no |
| <a name="input_key_vault_keyreaders_object_ids"></a> [key\_vault\_keyreaders\_object\_ids](#input\_key\_vault\_keyreaders\_object\_ids) | Object Ids needing Key read access to the Key Vault | `list(string)` | `[]` | no |
| <a name="input_keyreaders_vault_cert_permissions"></a> [keyreaders\_vault\_cert\_permissions](#input\_keyreaders\_vault\_cert\_permissions) | Cert Permissions for KeyVault Key Readers | `list(string)` | <pre>[<br>  "get",<br>  "list",<br>  "create",<br>  "import",<br>  "getissuers",<br>  "listissuers"<br>]</pre> | no |
| <a name="input_keyreaders_vault_key_permissions"></a> [keyreaders\_vault\_key\_permissions](#input\_keyreaders\_vault\_key\_permissions) | Key Permissions for KeyVault Key Readers | `list(string)` | <pre>[<br>  "encrypt",<br>  "decrypt",<br>  "get",<br>  "list",<br>  "unwrapKey",<br>  "verify",<br>  "create",<br>  "import"<br>]</pre> | no |
| <a name="input_keyreaders_vault_secret_permissions"></a> [keyreaders\_vault\_secret\_permissions](#input\_keyreaders\_vault\_secret\_permissions) | Secret Permissions for KeyVault Key Readers | `list(string)` | <pre>[<br>  "set",<br>  "get",<br>  "list"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource will be created. | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Key Vault. | `any` | n/a | yes |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Sets which traffic can bypass the network rules. | `string` | `"AzureServices"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. | `string` | `"Deny"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Key Vault. | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The Name of the SKU used for this Key Vault. | `string` | `"standard"` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Storage account ID to save keyvault diagnostic settings | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources | `map` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | `any` | n/a | yes |
| <a name="input_vault_cert_permissions"></a> [vault\_cert\_permissions](#input\_vault\_cert\_permissions) | Cert Permissions | `list(string)` | <pre>[<br>  "backup",<br>  "create",<br>  "delete",<br>  "deleteissuers",<br>  "get",<br>  "getissuers",<br>  "import",<br>  "list",<br>  "listissuers",<br>  "purge",<br>  "recover",<br>  "restore",<br>  "update"<br>]</pre> | no |
| <a name="input_vault_key_permissions"></a> [vault\_key\_permissions](#input\_vault\_key\_permissions) | Key Permissions | `list(string)` | <pre>[<br>  "backup",<br>  "create",<br>  "decrypt",<br>  "delete",<br>  "encrypt",<br>  "get",<br>  "import",<br>  "list",<br>  "purge",<br>  "recover",<br>  "restore",<br>  "sign",<br>  "unwrapKey",<br>  "update",<br>  "verify",<br>  "wrapKey"<br>]</pre> | no |
| <a name="input_vault_secret_permissions"></a> [vault\_secret\_permissions](#input\_vault\_secret\_permissions) | Secret Permissions | `list(string)` | <pre>[<br>  "backup",<br>  "delete",<br>  "get",<br>  "list",<br>  "purge",<br>  "recover",<br>  "restore",<br>  "set"<br>]</pre> | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet ID's which should be able to access this Key Vault. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The Tenant ID of the Key Vault's Azure AD |
| <a name="output_vault_id"></a> [vault\_id](#output\_vault\_id) | The ID of the Key Vault. |
| <a name="output_vault_name"></a> [vault\_name](#output\_vault\_name) | The name of the Key Vault |
| <a name="output_vault_resource_group_name"></a> [vault\_resource\_group\_name](#output\_vault\_resource\_group\_name) | The name of the Key Vault resource\_group |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | The URI of the Key Vault, used for performing operations on keys and secrets. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
