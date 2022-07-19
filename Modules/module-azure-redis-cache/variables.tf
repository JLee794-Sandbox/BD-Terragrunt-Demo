variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  default     = "eastus"
  description = "Redis Cache resource location"
}

variable "tags" {
  type        = map(any)
  description = "A mapping of tags to assign to resource group"
  default     = {}
}


variable "name" {
  description = "The name of the Redis instance. Changing this forces a new resource to be created."
}


variable "capacity" {
  default     = "1"
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
}


variable "family" {
  type        = map(any)
  description = " The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)"
  default = {
    Basic    = "C",
    Standard = "C",
    Premium  = "P"
  }
}

variable "redis_cache_sku_name" {
  default     = "Basic"
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
}

variable "redis_version" {
  type        = string
  description = "Default version for Redis Cache, only major versions allowed (4 or 6)"
  default     = "6"
}

variable "subnet_id" {
  default     = ""
  description = "Only available when using the Premium SKU The ID of the Subnet within which the Redis Cache should be deployed. This Subnet must only contain Azure Cache for Redis instances without any other type of resources. Changing this forces a new resource to be created."
}

variable "shard_count" {
  default     = "0"
  description = "Only available when using the Premium SKU The number of Shards to create on the Redis Cluster."
}

variable "minimum_tls_version" {
  default     = "1.2"
  description = "The minimum TLS version. Defaults to 1.2"
}

variable "enable_non_ssl_port" {
  default     = "false"
  description = "Enable the non-SSL port (6379) - disabled by default."
}

variable "create_redis_cache" {
  default     = true
  description = "Create Redis Cache"
}
