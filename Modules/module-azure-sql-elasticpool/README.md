# module-azure-sql_elasticpool

Terraform module to provision a [Azure SQL Elasticpool ](<https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-pool-overview>).

## Usage

```HCL
module "azure_sql_elasticpool" {
  source                                   = "./../module-azure-sql-elasticpool"
  resource_group_name                      = "rg-rnd-uis-dev-eastus-01"
  name                                     = "uis-rnd-uis-dev-eastus-01"
  location                                 = "eastus"
  server_name                              = <sql_server_name>
  license_type                             = "LicenseIncluded"
  max_size_gb                              = 32
  sku_name                                 = "GP_Gen5_2"
  sku_tier                                 = "GeneralPurpose"
  sku_family                               = "Gen5"
  sku_capacity                             = 2
  per_database_settings_min_capacity       = 0
  per_database_settings_max_capacity       = 2

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

This module creates an Azure MSSQL elastic pool.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | Resource group name. This must be the same as the resource group of the underlying SQL server. | string | n/a | yes |
| name | The name of the MSSQL elastic pool, prefix "mssql-elasticpool" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where Azure MSSQL elasticpool will be created. | string | eastus | yes |
| server_name | The name of the SQL Server on which to create the elastic pool. | string | n/a | yes |
| license_type | Valid values are LicenseIncluded or BasePrice. | string | LicenseIncluded | no |
| max_size_gb | Max data size of the elastic pool in gigabytes. | number | 32 | no |
| tags | A mapping of tags to assign to the resource. | list | {} | no |
| zone_redundant | Whether or not this elastic pool is zone redundant. 'tier' needs to be 'Premium' for 'DTU' based or 'BusinessCritical' for 'vCore' based 'sku'. Defaults to 'false'. | string | false | no |
| sku_name | SKU Name for this Elasticpool. | string | GP_Gen5_2 | yes |
| sku_tier | SKU Tier for this Elasticpool. | string | GeneralPurpose | yes |
| sku_family | SKU Family for this Elasticpool. | string | Gen5 | no |
| sku_capacity | Scale up/out capacity, representing server's compute units. | number | 2 | yes |
| per_database_settings_min_capacity | Minimum capacity all databases are guaranteed. | number | 0 | yes |
| per_database_settings_max_capacity | Maximum capacity any one database can consume. | number | 2 | yes |



## Outputs

| Name | Description |
|------|-------------|
|mssql_elasticpool_id| MSSQL elastic pool ID |


## Changelog

### v 0.0.1 2020-04-23

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
| [azurerm_mssql_elasticpool.mssql_elasticpool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_elasticpool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Valid values are LicenseIncluded or BasePrice | `string` | `"LicenseIncluded"` | no |
| <a name="input_location"></a> [location](#input\_location) | MSSQL elastic pool resource location. Changing this forces a new resource to be created. | `string` | `"eastus"` | no |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | Max data size of the elastic pool in gigabytes | `number` | `32` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the MSSQL elastic pool to create. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_per_database_settings_max_capacity"></a> [per\_database\_settings\_max\_capacity](#input\_per\_database\_settings\_max\_capacity) | Maximum capacity any one database can consume | `number` | `2` | no |
| <a name="input_per_database_settings_min_capacity"></a> [per\_database\_settings\_min\_capacity](#input\_per\_database\_settings\_min\_capacity) | Minimum capacity all databases are guaranteed | `number` | `0` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name. This must be the same as the resource group of the underlying SQL server. | `any` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the SQL server on which to create the elastic pool. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_sku_capacity"></a> [sku\_capacity](#input\_sku\_capacity) | Scale up/out capacity, representing server's compute units | `number` | `2` | no |
| <a name="input_sku_family"></a> [sku\_family](#input\_sku\_family) | SKU Family for this Elasticpool | `string` | `"Gen5"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | SKU Name for this Elasticpool | `string` | `"GP_Gen5"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | SKU Tier for this Elasticpool | `string` | `"GeneralPurpose"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(any)` | `{}` | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Whether or not this elastic pool is zone redundant. 'tier' needs to be 'Premium' for 'DTU' based or 'BusinessCritical' for 'vCore' based 'sku'. Defaults to 'false' | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_elasticpool_id"></a> [mssql\_elasticpool\_id](#output\_mssql\_elasticpool\_id) | MSSQL elastic pool ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
