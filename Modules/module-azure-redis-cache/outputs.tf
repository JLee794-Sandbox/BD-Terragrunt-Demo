output "redis_id" {
  value       = azurerm_redis_cache.redis_cache[*].id
  description = "Redis instance id"
}

output "redis_name" {
  value       = azurerm_redis_cache.redis_cache[*].name
  description = "Redis instance name"
}

output "redis_hostname" {
  value       = azurerm_redis_cache.redis_cache[*].hostname
  description = "Redis instance hostname"
}

output "redis_ssl_port" {
  value       = azurerm_redis_cache.redis_cache[*].ssl_port
  description = "Redis instance SSL port"
}

output "redis_port" {
  value       = azurerm_redis_cache.redis_cache[*].port
  description = "Redis instance port"
}

output "redis_cache_sku_name" {
  value       = azurerm_redis_cache.redis_cache[*].sku_name
  description = "Redis SKU name"
}

output "redis_family" {
  value       = azurerm_redis_cache.redis_cache[*].family
  description = "Redis family"
}

output "redis_capacity" {
  value       = azurerm_redis_cache.redis_cache[*].capacity
  description = "Redis capacity"
}
