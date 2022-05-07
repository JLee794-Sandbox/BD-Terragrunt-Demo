variable "deploy_log_analytics_workspace" {
  description = "If set to True, log_analytics_workspace will be deployed within AKS cluster"
  default     = false
}

variable "name" {
  description = "The name of the log analytics workspace to create. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which the Virtual Network"
}

variable "location" {
  description = "The Azure Region in which to create the Virtual Network"
  default     = "eastus2"
}

variable "sku_log_analytics_workspace" {
  description = "The SKU (pricing level) of the Log Analytics workspace"
  default     = "Free"
}

variable "logs_retention_in_days" {
  description = "The retention period for the logs in days"
  default     = 30
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for ingestion in GB."
  default     = null
}

variable "internet_ingestion_enabled" {
  description = "Should the Log Analytics Workflow support ingestion over the Public Internet?"
  default     = true
}

variable "internet_query_enabled" {
  description = "Should the Log Analytics Workflow support querying over the Public Internet? "
  default     = true
}

variable "tags" {
  description = "A mapping of tags to assign to resources"
  default     = {}
}
