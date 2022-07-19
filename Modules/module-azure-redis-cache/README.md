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
| [azurerm_redis_cache.redis_cache](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4. | `string` | `"1"` | no |
| <a name="input_create_redis_cache"></a> [create\_redis\_cache](#input\_create\_redis\_cache) | Create Redis Cache | `bool` | `true` | no |
| <a name="input_enable_non_ssl_port"></a> [enable\_non\_ssl\_port](#input\_enable\_non\_ssl\_port) | Enable the non-SSL port (6379) - disabled by default. | `string` | `"false"` | no |
| <a name="input_family"></a> [family](#input\_family) | The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium) | `map(any)` | <pre>{<br>  "Basic": "C",<br>  "Premium": "P",<br>  "Standard": "C"<br>}</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Redis Cache resource location | `string` | `"eastus"` | no |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum TLS version. Defaults to 1.2 | `string` | `"1.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Redis instance. Changing this forces a new resource to be created. | `any` | n/a | yes |
| <a name="input_redis_cache_sku_name"></a> [redis\_cache\_sku\_name](#input\_redis\_cache\_sku\_name) | The SKU of Redis to use. Possible values are Basic, Standard and Premium. | `string` | `"Basic"` | no |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | Default version for Redis Cache, only major versions allowed (4 or 6) | `string` | `"6"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_shard_count"></a> [shard\_count](#input\_shard\_count) | Only available when using the Premium SKU The number of Shards to create on the Redis Cluster. | `string` | `"0"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource group | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_cache_sku_name"></a> [redis\_cache\_sku\_name](#output\_redis\_cache\_sku\_name) | Redis SKU name |
| <a name="output_redis_capacity"></a> [redis\_capacity](#output\_redis\_capacity) | Redis capacity |
| <a name="output_redis_family"></a> [redis\_family](#output\_redis\_family) | Redis family |
| <a name="output_redis_hostname"></a> [redis\_hostname](#output\_redis\_hostname) | Redis instance hostname |
| <a name="output_redis_id"></a> [redis\_id](#output\_redis\_id) | Redis instance id |
| <a name="output_redis_name"></a> [redis\_name](#output\_redis\_name) | Redis instance name |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | Redis instance port |
| <a name="output_redis_ssl_port"></a> [redis\_ssl\_port](#output\_redis\_ssl\_port) | Redis instance SSL port |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
