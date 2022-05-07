variable "name" {
  description = "The name of the MSSQL elastic pool to create. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "Resource group name. This must be the same as the resource group of the underlying SQL server."
}

variable "location" {
  default     = "eastus"
  description = "MSSQL elastic pool resource location. Changing this forces a new resource to be created."
}

variable "server_name" {
  description = "Name of the SQL server on which to create the elastic pool. Changing this forces a new resource to be created."
}

variable "license_type" {
  default     = "LicenseIncluded"
  description = "Valid values are LicenseIncluded or BasePrice"
}

variable "max_size_gb" {
  default     = 32
  description = "Max data size of the elastic pool in gigabytes"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "zone_redundant" {
  description = "Whether or not this elastic pool is zone redundant. 'tier' needs to be 'Premium' for 'DTU' based or 'BusinessCritical' for 'vCore' based 'sku'. Defaults to 'false'"
   default     = false
}


variable "sku_name" {
  description = "SKU Name for this Elasticpool"
  default     = "GP_Gen5"
}

variable "sku_tier" {
  description = "SKU Tier for this Elasticpool"
  default     = "GeneralPurpose"
}

variable "sku_family" {
  description = "SKU Family for this Elasticpool"
  default     = "Gen5"
}

variable "sku_capacity" {
  description = "Scale up/out capacity, representing server's compute units"
  default     = 2
}

variable "per_database_settings_min_capacity" {
  description = "Minimum capacity all databases are guaranteed"
  default     = 0
}

variable "per_database_settings_max_capacity" {
  description = "Maximum capacity any one database can consume"
  default     = 2
}
