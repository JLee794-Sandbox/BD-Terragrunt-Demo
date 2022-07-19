# -
# - Azure SQL Server Required Parameters
# -

variable "private_endpoints" {
  type = map(object({
    subnet_id : string,
    private_connection_resource_id : string,
    subresource_names : list(string),
    private_dns_zone_name : string,
    tags : map(string)
  }))
  nullable = true

  description = "Map of private endpoint configuartions to allow multiple endpoints to be generated from a single module."
}

# variable "name" {
#   type        = string
#   description = "(Required) The name of the Azure SQL Server"
# }
# variable "subnet_id" {
#   type        = string
#   description = "(Required) The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
# }

# variable "private_connection_resource_id" {
#   type        = string
#   description = "(Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
# }

# variable "private_dns_zone_name" {
#   type        = string
#   description = "(Required) The location to deploy resources to."
# }

variable "resource_group_name" {
  type        = string
  description = "(Optional) The name of the resource group in which to create the MySQL Server"
}

variable "location" {
  type        = string
  description = "(Required) The location to deploy resources to."
}


# -
# - Optional Parameters
# -
variable "subresource_names" {
  type        = list(string)
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to."
  default     = []
}

variable "ttl" {
  type        = string
  description = "(Optional) The time to live for each connection to the private_dns_zone."
  default     = "300"
}



variable "vnet_name" {
  type        = string
  description = "(Optional) The Name of the virtual network to associate the Private DNS Zone with."
  default     = ""
}

variable "vnet_resource_group_name" {
  type        = string
  description = "(Optional) If the virtual network is in a different resource group, specify the name of the resource group here."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the resource"
  default = {
    pe_enable = true
  }
}
