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
