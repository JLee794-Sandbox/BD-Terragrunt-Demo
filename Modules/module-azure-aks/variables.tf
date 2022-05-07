variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  default     = "eastus"
  description = "AKS resource location"
}

variable "tags" {
  description = "A mapping of tags to assign to resource group"
  default     = {}
}

variable "name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}

variable "dns_prefix" {
  default     = "uis-dev-001"
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
}

variable "kubernetes_version" {
  default     = "1.19.7"
  description = "Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
}

variable "pool_name" {
  default     = "default"
  description = "The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
}

variable "node_count" {
  default     = "1"
  description = "The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count."
}

variable "vm_size" {
  default     = "Standard_DS2_v2"
  description = "The size of the Virtual Machine"
}

variable "vnet_subnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created.NOTE:A Route Table must be configured on this Subnet."
}

variable "network_plugin" {
  default     = "azure"
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created."
}

variable "enable_auto_scaling" {
  default     = "false"
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
}

variable "max_count" {
  default     = "3"
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
}

variable "min_count" {
  default     = "1"
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
}

variable "admin_username" {
  default     = "bd_admin"
  description = "The Public SSH Key used to access the cluster. Changing this forces a new resource to be created."
}

variable "availability_zones" {
  description = "A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  type        = list(string)
  default     = null
}

variable "service_cidr" {
  default     = null
  description = "Network range used by the Kubernetes service."
}

variable "dns_service_ip" {
  default     = null
  description = "IP address within the Kubernetes service address range used by cluster service discovery (kube-dns)."
}

variable "docker_bridge_cidr" {
  default     = null
  description = " IP address (in CIDR notation) used as the Docker bridge IP address on nodes."
}

variable "keyvault_name" {
  description = "example: kvuisinfradeus001 - Specifies the name of the Key Vault where SSH key and KEK is stored."
}

variable "keyvault_id" {
  description = "keyvault ID"
}

variable "keyvault_resource_group_name" {
  description = "example: rg-uis-infra-dev-eastus-001 - The name of the Resource Group in which the Key Vault exists."
}

variable "rg_id" {
  type    = string
  default = ""
}

variable "oms_agent_enabled" {
  description = "AddOn Profile block."
  default     = false # Enable Container Monitoring
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to."
  default     = null
}
