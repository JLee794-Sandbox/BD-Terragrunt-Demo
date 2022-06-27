variable "name" {
  type        = string
  description = "The name of the storage account."
}

variable "resource_group_name" {
  type        = string
  description = "The name of an existing resource group."
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "The name of the location."
}

variable "storage_account_type" {
  type        = string
  default     = "StorageV2"
  description = "The type of storage account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2."
}

variable "storage_account_tier" {
  type        = string
  default     = "Standard"
  description = "The account tier of the storage account."
}

variable "container_name" {
  type        = string
  default     = "provisioning-session-contents"
  description = "The name of storage container."
}

variable "storage_share_quota" {
  type        = string
  default     = "5"
  description = "Storage share quota"
}

variable "storage_account_access_tier" {
  type        = string
  default     = "Hot"
  description = "Defines the access tier for BlobStorage and StorageV2 accounts. Valid options are Hot and Cool."
}

variable "storage_account_replication_type" {
  type        = string
  default     = "RAGRS"
  description = "The replication type of the storage account."
}


variable "https_only" {
  type        = bool
  default     = true
  description = "Set to `true` to only allow HTTPS traffic, or `false` to disable it."
}

variable "assign_identity" {
  type        = bool
  default     = true
  description = "Set to `true` to enable system-assigned managed identity, or `false` to disable it."
}

variable "tags" {
  description = "A mapping of tags to assign to resource"
  default     = {}
  type        = map(any)
}

variable "default_action" {
  default     = "Deny"
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids."
}

variable "bypass" {
  default     = ["AzureServices"]
  description = "Sets which traffic can bypass the network rules. "
}


variable "ip_rules" {
  default     = null
  description = "The list of IP CIRDs to initially grant access to storage account"
  type        = list(string)
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "One or more Subnet ID's which should be able to access this Key Vault."
}

variable "create_storage_share" {
  default     = true
  description = "Create storage file share"
}

variable "create_storage_account" {
  default     = true
  description = "Create storage account"
}
