variable "name" {
  description = "Virtual network name"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Virtual network location -	westeurope/eastus"
}

variable "address_space" {
  description = "Virtual network address space" #- ["10.0.0.0/19"]
  type        = list(any)
}

variable "tags" {
  description = "A mapping of tags to assign to virtual network"
  type        = map(any)
  default     = {}
}

#--------DNS-------------------------------------------------------
variable "private_domain_name" {
  description = "The name of the Private DNS Zone"
  type        = string
  default     = "bd.local"
}

variable "public_domain_name" {
  description = "The name of the Public DNS Zone"
  type        = string
  default     = ""
}

variable "registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled"
  default     = "true"
}

# VNet Peering optional arg
variable "target_vnet_id_for_peering" {
  description = "The ID of the virtual network to peer with"
  type        = string
  default     = ""
}
