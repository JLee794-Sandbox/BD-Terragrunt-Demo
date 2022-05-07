variable "name" {
  description = "Name of the CosmosDB Account."
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  description = "The Azure Region in which to create resource."
}

variable "mongo_server_version" {
  default = "3.2"
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}

variable "databases" {
  description = "List of databases"
  type = map(object({
    collections = list(object({
      name       = string
      shard_key  = string
      throughput = number
    }))
  }))
  default = {}
}

variable "diagnostics" {
  description = "Diagnostic settings for those resources that support it. See README.md for details on configuration."
  type = object({
    destination = string
    logs        = list(string)
  })
  default = null
}

variable "ip_range_filter" {
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  type        = string
  default     = null
}

variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filtering for this Cosmos DB account"
  type        = bool
  default     = false
}

variable "virtual_network_rule" {
  description = "Specifues a virtual_network_rules resource used to define which subnets are allowed to access this CosmosDB account"
  type = list(object({
    id                                   = string,
    ignore_missing_vnet_service_endpoint = bool
  }))
  default = null
}

variable "capabilities" {
  description = "Configures the capabilities to enable for this Cosmos DB account. Check README.md for valid values."
  type        = list(string)
  default     = null
}

variable "log_analytics_workspace_id" {
  type    = string
  default = "/subscriptions/0e4024d6-f954-443d-9342-7b40c50c5bb5/resourcegroups/rg-rnd-uis-shared-eastus-1/providers/microsoft.operationalinsights/workspaces/log-rnd-uis-shared-eastus-1"
}

variable "create_cosmos_db" {
  default     = true
  description = "Create Cosmos DB"
}
