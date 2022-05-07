variable "name" {
  description = "Subnet name"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "virtual_network_name" {
  description = "Virtual network name"
}

variable "address_prefixes" {
  description = "Subnet address prefix" #- ["10.0.1.0/24"]
  type = list(string)
  default     = []
}

variable "service_endpoints" {
  description = " The list of Service endpoints to associate with the subnet. Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql and Microsoft.Storage."
  type        = list
  default     = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.Web"]
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the subnet."
  type        = string
  default     = ""
}
