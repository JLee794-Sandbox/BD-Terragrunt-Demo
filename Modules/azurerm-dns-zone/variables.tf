variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Virtual network location -	westeurope/eastus"
}

variable "dns_a_records" {
  description = "Map of A Records"
  type        = map(any)
  # type = map({
  #   zone_name = string
  #   ttl       = string
  #   records   = list(string)
  # })
  default = {}
}

variable "tags" {
  description = "A mapping of tags to assign to virtual network"
  type        = map(any)
  default     = {}
}

#--------DNS-------------------------------------------------------
variable "public_domain_name" {
  description = "The name of the Public DNS Zone"
  type        = string
  default     = "bd.public"
}

variable "registration_enabled" {
  description = "Is auto-registration of virtual machine records in the virtual network in the Private DNS zone enabled"
  default     = "true"
}
