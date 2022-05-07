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
