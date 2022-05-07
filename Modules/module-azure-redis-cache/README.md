# module-azure-redis-cache

Terraform module to provision a [Azure Redis Cache](<https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-overview>).

## Usage

```HCL
module "redis_cache" {
  source                    = "./../modules/module-azure-redis-cache"
  resource_group_name       = "rg-rnd-uis-dev-eastus-01"
  name                      = "rnd-uis-dev-eastus-01"
  location                  = "eastus"
  redis_cache_sku_name      = "Basic"

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

This module creates an Azure Redis Cache to improve application performance.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group where Azure Redis Cache will be located | string | n/a | yes |
| name | The name of the Azure Redis Cache, prefix "redis-" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where Azure Redis Cache will be created. | string | eastus | yes |
| capacity | The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4. | string | 1 | yes |
| family | The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium) | map | C,P | yes |
| redis_cache_sku_name |  The SKU of Redis to use. Possible values are Basic, Standard and Premium. | string | Basic | yes |
| subnet_id | Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created. | string | "" | no |
| shard_count |Only available when using the Premium SKU The number of Shards to create on the Redis Cluster.| string | 0 | no |
| minimum_tls_version | The minimum TLS version. Defaults to 1.2 | string | 1.2 | yes|
| enable_non_ssl_port |Enable the non-SSL port (6379) - disabled by default. | string | false | no |
| tags | A mapping of tags assigned to the Azure Redis Cache | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| redis_id | Redis instance id. |
| redis_name | Redis instance name.|
| redis_hostname | Redis instance hostname.|
| redis_ssl_port | Redis instance SSL port.|
| redis_port | Redis instance port.|
| redis_cache_sku_name | Redis SKU name.|
| redis_family | Redis family.|
| redis_capacity | Redis capacity.|

## Changelog

### v 0.0.1 2020-11-16

* Initial version
