variable "name" {
  description = "Application Gateway name"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Application Gateway location -	eastus"
}

variable "tags" {
  description = "A mapping of tags to assign to Application Gateway"
  default     = {}
}

variable "zones" {
  default     = []
  description = "A collection containing the availability zone to allocate resources in"
  type        = list(any)
}

#------Public IP----------------------------
variable "public_ip_allocation_method" {
  default     = "Static"
  description = "Public Ip allocation method - Static/Dynamic"
}

variable "public_ip_sku" {
  default     = "Standard"
  description = "The SKU of the Public IP - Basic/Standard"
}

variable "public_ip_ip_version" {
  default     = "IPv4"
  description = "The IP Version to use - IPv4/IPv6"
}
#-------------------------------------------

#------SKU----------------------------------
variable "sku_name" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2"
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard_v2, WAF and WAF_v2"
  default     = "Standard_v2"
}

variable "sku_capacity" {
  description = "The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU"
  default     = 2
}
#-------------------------------------------
#------WAF policy---------------------------

variable "waf_enabled" {
  description = "Set to true to enable WAF on Application Gateway."
  type        = bool
}

variable "waf_configuration" {
  description = "(required) list applicatin gateway waf_configuration"
  default     = []
}

variable "policy_settings_enabled" {
  description = "Set to true to enable WAF on Application Gateway."
  type        = bool
  default     = true
}
variable "policy_settings_mode" {
  description = "Set to true to enable WAF on Application Gateway."
  type        = string
  default     = "Prevention"
}

variable "waf_rule_set_version" {
  description = "The Version of the Rule Set used for this Web Application Firewall. Possible values are 2.2.9, 3.0, 3.1, and 3.2."
  type        = string
  default     = "3.1"
}

#-------------------------------------------
#------IP Configuration---------------------
variable "gateway_ip_configuration_subnet_id" {
  description = "Subnet ID"
}

variable "gateway_ip_configuration_network_security_group_name" {
  description = "Network security group name assigned to subnet"
}

#-------------------------------------------

#------Frontend Ports------------------------

variable "frontend_ports" {
  description = "List of maps including frontend ports configurations"
  type        = list(any)
}
#-------------------------------------------

#------Backend Service Settings-------------
variable "backend_services" {
  description = "List of maps including backend services configurations"
  type        = list(any)
}

#------Backend Address Pool------------------------
variable "backend_address_pool_fqdns" {
  description = "A list of FQDN's which should be part of the Backend Address Pool"
  type        = list(any)
}

variable "backend_address_pool" {
  description = "List of maps including backend services configurations"
  type        = list(any)
}
#-------------------------------------------

#------SSL----------------------------------
variable "trusted_root_certificate_path" {
  description = "The file path of the Trusted Root Certificate which should be used."
}

variable "key_vault_secret_id" {
  description = "Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault."
}

variable "ps_key_vault_secret_id" {
  description = "Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault."
}
#-------------------------------------------

#------MSI----------------------------------

variable "identity_ids" {
  description = "Specifies a list with a single user managed identity id to be assigned to the Application Gateway"
  default     = []
}
#-------------------------------------------

#------NSG----------------------------------

variable "inbound_whitelist_ips" {
  description = "List of whitelisted IP address for HTTPS inbound"
  default     = "0.0.0.0"
}
#-------------------------------------------

#------Custom Probes----------------------------------

variable "custom_probes" {
  description = "List of maps for custom probes for Web/Function Apps"
  type        = list(any)
}

#-------------------------------------------
