# module-azure-container-registry

Terraform module to provision a [Azure Storage Account](<https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview/>).

## Usage

```HCL
module "storage_account" {
  source                            = "./../module-azure-storage-account"
  resource_group_name               = "rg-rnd-uis-dev-eastus-01"
  name                              = "rnduisdeus01"
  storage_account_type              = "StorageV2"
  location                          = "eastus"
  virtual_network_subnet_ids = ["/subscriptions/0e4024d6-f954-443d-9342-7b40c50c5bb5/resourceGroups/rg-rnd-uis-shared-eastus-01/providers/Microsoft.Network/virtualNetworks/vnet-rnd-uis-shared-eastus-01/subnets/sneti-rnd-uis-shared-eastus-01"]


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

This module creates an Azure Storage Account to be used to store some data.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group where storage account will be created | string | n/a | yes |
| name | The name of the Azure Storage Account (must be between 3 and 24 characters in length and may contain numbers and lowercase letters only) prefix "st" will be added at the beginning automatically via terraform according to naming convention| string | n/a | yes |
| location | Specifies the supported Azure location where the Azure Storage Account will be created. | string | eastus | yes |
| storage_account_type | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | string | StorageV2 | yes |
| storage_account_tier |  The account tier of the storage account.Valid options are Standard, Premium | string | Standard | yes |
| storage_account_access_tier | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | string | Cool | yes |
| storage_account_replication_type | The replication type of the storage account. (LRS,RAGRS,ZRS..) | string | RAGRS | yes |
| https_only | Set to `true` to only allow HTTPS traffic, or `false` to disable it. | bool | true | yes |
| assign_identity | Set to `true` to enable system-assigned managed identity, or `false` to disable it. | bool | true | yes |
| virtual_network_subnet_ids | One or more Subnet ID's which should be able to access this Key Vault. | list | `<list>` | no |
| bypass | Sets which traffic can bypass the network rules. | list | `["AzureServices"]` | no |
| default_action | The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. | string | `"Deny"` | no |
| create_storage_share | Create storage file share | string | true | no |



## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Azure Container Registry. |
| storage_account_id | The ID of the storage account.|
| storage_account_name | The name of the storage account.|
| storage_account_primary_location | The primary location of the storage account|
| storage_share_id | The ID of the File Share.|

## Changelog

### v 0.0.2 2021-06-01

* Adding file share

### v 0.0.1 2020-11-11

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
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_share.storage_share](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_identity"></a> [assign\_identity](#input\_assign\_identity) | Set to `true` to enable system-assigned managed identity, or `false` to disable it. | `bool` | `true` | no |
| <a name="input_bypass"></a> [bypass](#input\_bypass) | Sets which traffic can bypass the network rules. | `list` | <pre>[<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of storage container. | `string` | `"provisioning-session-contents"` | no |
| <a name="input_create_storage_account"></a> [create\_storage\_account](#input\_create\_storage\_account) | Create storage account | `bool` | `true` | no |
| <a name="input_create_storage_share"></a> [create\_storage\_share](#input\_create\_storage\_share) | Create storage file share | `bool` | `true` | no |
| <a name="input_default_action"></a> [default\_action](#input\_default\_action) | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. | `string` | `"Deny"` | no |
| <a name="input_https_only"></a> [https\_only](#input\_https\_only) | Set to `true` to only allow HTTPS traffic, or `false` to disable it. | `bool` | `true` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | The list of IP CIRDs to initially grant access to storage account | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The name of the location. | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the storage account. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of an existing resource group. | `string` | n/a | yes |
| <a name="input_storage_account_access_tier"></a> [storage\_account\_access\_tier](#input\_storage\_account\_access\_tier) | Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool. | `string` | `"Hot"` | no |
| <a name="input_storage_account_replication_type"></a> [storage\_account\_replication\_type](#input\_storage\_account\_replication\_type) | The replication type of the storage account. | `string` | `"RAGRS"` | no |
| <a name="input_storage_account_tier"></a> [storage\_account\_tier](#input\_storage\_account\_tier) | The account tier of the storage account. | `string` | `"Standard"` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. | `string` | `"StorageV2"` | no |
| <a name="input_storage_share_quota"></a> [storage\_share\_quota](#input\_storage\_share\_quota) | Storage share quota | `string` | `"5"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource | `map(any)` | `{}` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | One or more Subnet ID's which should be able to access this Key Vault. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | The ID of the storage account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | The name of the storage account. |
| <a name="output_storage_account_primary_location"></a> [storage\_account\_primary\_location](#output\_storage\_account\_primary\_location) | The primary location of the storage account |
| <a name="output_storage_share_id"></a> [storage\_share\_id](#output\_storage\_share\_id) | The ID of the File Share. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
