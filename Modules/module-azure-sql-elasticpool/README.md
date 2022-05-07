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
