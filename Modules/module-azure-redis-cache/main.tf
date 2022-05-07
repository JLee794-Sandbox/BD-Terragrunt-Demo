resource "azurerm_redis_cache" "redis_cache" {
  count                = var.create_redis_cache ? 1 : 0
  name                = lower(join("", ["redis-", format("%v", var.name)]))
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  sku_name            = var.redis_cache_sku_name
  family              = lookup(var.family, var.redis_cache_sku_name)
  shard_count         = var.redis_cache_sku_name == "Premium" ? var.shard_count : null
  subnet_id           = var.redis_cache_sku_name == "Premium" ? var.subnet_id : null
  enable_non_ssl_port = var.enable_non_ssl_port
  minimum_tls_version = var.minimum_tls_version
  redis_version       = var.redis_version
  tags                = var.tags
  redis_configuration {
  }
}
