variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  default     = "eastus"
  description = "Resource location"
}

variable "tags" {
  description = "A mapping of tags to assign to dashboard"
  default     = {}
}

variable "name" {
  description = "The name of the Dashboard to create. Changing this forces a new resource to be created."
}

variable "env" {
  description = "The name of the environment / namespace to monitor"
}

variable "cluster_name" {
  description = "The name of the AKS cluster to scrape data."
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace to take data from."
  default     = null
}

variable "log_analytics_workspace_name" {
  description = "The Name of the Log Analytics Workspace to take data from."
  default     = null
}

variable "redis_name" {
  description = "The name of Redis Cache cluster"
  default     = null
}

variable "app_gateway_name" {
  description = "Application Gateway name"
  default     = null
}

variable "database_name" {
  description = "Database name"
  default     = null
}

variable "database_server_name" {
  description = "Database server name"
  default     = null
}

variable "dashboard_enabled" {
  description = "Dashboard enabled flag"
  default     = false
}
