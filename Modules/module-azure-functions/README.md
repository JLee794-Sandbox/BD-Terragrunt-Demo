# module-azure-functions

Terraform module to provision an [Azure Function](<https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview/>).

## Usage

```HCL
module "azure_functions" {
  source              = "./../modules/module-azure-functions"
  name                = "rnduisdeus01"
  location            = "eastus"
  resource_group_name = "rg-rnd-uis-dev-eastus-01"

  storage_account_type = "StorageV2"

  virtual_network_subnet_ids = ["/subscriptions/0e4024d6-f954-443d-9342-7b40c50c5bb5/resourceGroups/rg-rnd-uis-shared-eastus-01/providers/Microsoft.Network/virtualNetworks/vnet-rnd-uis-shared-eastus-01/subnets/sneti-rnd-uis-shared-eastus-01"]

  tags = {
    "Confidentiality" : "private"
    "SLA"             : "24hours"
    "BusinessImpact"  : "Moderate"
    "BusinessProcess" : "Support"
    "RevenueImpact"   : "High"
    "ManagedBy"       : "DevOps"
  }
}
```
## Module Details

This module creates an Azure Function along with a Storage Account and Service Plan.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| resource_group_name | The name of the Resource Group where the Azure Function will be created | string | n/a | yes |
| name | The name of the Azure Function (must be between 3 and 60 characters in length) prefix "func-ims-" will be added at the beginning automatically via terraform according to naming convention| string | n/a | yes |
| storage_account_short_name | The name of the storage account (must be between 3 and 24 characters in length and may contain numbers and lowercase letters only). Will be prepended with `stf`. | string | n/a | yes |
| location | Specifies the supported Azure location where the Azure Function will be created. | string | eastus | yes |
| app_runtime_version | The Function Application's runtime version. | string | `~3` | yes |
| sku_tier | Specifies the plan's pricing tier. | string | `"Dynamic"` | yes |
| sku_size | Specifies the plan's instance size. | string | `"Y1"` | yes |
| storage_account_type | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | string | StorageV2 | yes |
| storage_account_tier |  The account tier of the storage account.Valid options are Standard, Premium | string | Standard | yes |
| storage_account_access_tier | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | string | Cool | yes |
| storage_account_replication_type | The replication type of the storage account. (LRS,RAGRS,ZRS..) | string | RAGRS | yes |
| https_only | Set to `true` to only allow HTTPS traffic, or `false` to disable it. | bool | true | yes |
| assign_identity | Set to `true` to enable system-assigned managed identity, or `false` to disable it. | bool | true | yes |
| tags | A mapping of tags to assign to resource | map | `{}` | no |
| virtual_network_subnet_ids | One or more Subnet ID's which should be able to access this Key Vault. | list | `<list>` | no |
| virtual_network_name | The name of Virtual Network, where subnet will be placed | string | "" | yes |
| network_security_group_id | Security Group for internal subnet | string | "" | yes |
| address_prefixes | Address prefixes for internal subnet with delegation | "10.0.3.0/24" | yes |
| delegation\_prefix | Prefix for internal vnet delegation name. Will be used only in case of usage Premium Service App Plans | string | "to-sneti" | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Web and Microsoft.Storage. | list | `<list>` | no |
| ip_restriction_rules | The list of IP Restriction rules for inbound connection | list | `<list>` | yes |
| bypass | Sets which traffic can bypass the network rules. | list | `["AzureServices"]` | no |
| default_action | The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. | string | `"Deny"` | no |
| ip_rules | The list of IP CIRDs to initially grant access to storage account. | list(string) | n/a | no |
| always_on | Set status for Always On | bool | true | yes |
| app_settings | List of appsettings for VNET Integration | map | null | yes |

## Outputs

| Name | Description |
|------|-------------|
| function_name | The name of the Function App for Tenant Deploy. |
| function_id | The name of the Function Id for Tenant Deploy. |
| function_possible_outbound_ip | Function Possible Outbound IPs for whitelisting. |
| function_subnet_with_delegation | Subnet with delegation to Microsoft.Web/serverFarms |
| default_hostname | Function App FQDN |

## Changelog

### v 0.0.1 2021-05-13

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
| [azurerm_app_service_plan.app_service_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_app_service_virtual_network_swift_connection.vnet_integration_functions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_function_app.function_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/function_app) | resource |
| [azurerm_key_vault_access_policy.function_key_vault_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_storage_account.storage_account_functions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.storage_account_functions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_subnet.subnet_delegation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | Subnet with delegation address prefix | `list` | <pre>[<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_always_on"></a> [always\_on](#input\_always\_on) | n/a | `bool` | `true` | no |
| <a name="input_app_runtime_version"></a> [app\_runtime\_version](#input\_app\_runtime\_version) | The Function Application's runtime version. | `string` | `"~3"` | no |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | n/a | `map(string)` | `null` | no |
| <a name="input_assign_identity"></a> [assign\_identity](#input\_assign\_identity) | Set to `true` to enable system-assigned managed identity, or `false` to disable it. | `bool` | `true` | no |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Sets which traffic can bypass the network rules. | `list` | <pre>[<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_create_function"></a> [create\_function](#input\_create\_function) | Create Azure Function | `bool` | `true` | no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. | `string` | `"Deny"` | no |
| <a name="input_delegation_prefix"></a> [delegation\_prefix](#input\_delegation\_prefix) | n/a | `string` | `"to-subnet"` | no |
| <a name="input_ftps_state"></a> [ftps\_state](#input\_ftps\_state) | State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled. | `string` | `"Disabled"` | no |
| <a name="input_function_secret_permissions"></a> [function\_secret\_permissions](#input\_function\_secret\_permissions) | Secret Permissions | `list(string)` | <pre>[<br>  "get"<br>]</pre> | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Set to `true` to only allow HTTPS traffic, or `false` to disable it. | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | UserAssigned Identities ID to add to Function App. Mandatory if type is UserAssigned | `list(string)` | `null` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Add an Identity (MSI) to the function app. Possible values are SystemAssigned or UserAssigned | `string` | `"SystemAssigned"` | no |
| <a name="input_ip_restriction_rules"></a> [ip\_restriction\_rules](#input\_ip\_restriction\_rules) | List of Inbound Rules for IP Restriction | `list(any)` | n/a | yes |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | The list of IP CIRDs to initially grant access to storage account. | `list(string)` | `null` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | ID of keyvault | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The name of the location. | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure Function. | `string` | n/a | yes |
| <a name="input_network_security_group_id"></a> [network\_security\_group\_id](#input\_network\_security\_group\_id) | n/a | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of an existing resource group. | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web. | `list(any)` | <pre>[<br>  "Microsoft.Web",<br>  "Microsoft.Storage",<br>  "Microsoft.KeyVault"<br>]</pre> | no |
| <a name="input_sku_size"></a> [sku\_size](#input\_sku\_size) | Specifies the plan's instance size. | `string` | `"Y1"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | Specifies the plan's pricing tier. | `string` | `"Dynamic"` | no |
| <a name="input_storage_account_access_tier"></a> [storage\_account\_access\_tier](#input\_storage\_account\_access\_tier) | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | The replication type of the storage account. | `string` | `"LRS"` | no |
| <a name="input_storage_account_short_name"></a> [storage\_account\_short\_name](#input\_storage\_account\_short\_name) | The name of the storage account. | `string` | n/a | yes |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | The account tier of the storage account. | `string` | `"Standard"` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | `string` | `"StorageV2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource. | `map` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | `any` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | n/a | `string` | `""` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet ID's which should be able to access this Key Vault. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname associated with the Function App |
| <a name="output_function_id"></a> [function\_id](#output\_function\_id) | The ID of the Function App for Tenant Deploy |
| <a name="output_function_identity"></a> [function\_identity](#output\_function\_identity) | Identity block output of the Function App |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | The name of the Function App for Tenant Deploy |
| <a name="output_function_possible_outbound_ip"></a> [function\_possible\_outbound\_ip](#output\_function\_possible\_outbound\_ip) | Function Possible Outbound IPs for whitelisting |
| <a name="output_function_subnet_with_delegation"></a> [function\_subnet\_with\_delegation](#output\_function\_subnet\_with\_delegation) | Subnet with delegation to Microsoft.Web/serverFarms |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
