#Common
variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The location to deploy resources to."
}

variable "environment" {
  description = "The name of the environment that is being deployed"
}

variable "tags" {
  description = "Tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name of the deployment"
}

variable "domain_name_label" {
  description = "The Public DNS Name being created"
}

variable "target_subnet_id" {
  description = "Subnet ID to associate the Bastion subnet with."
  type        = string
}
variable "target_nsg_name" {
  description = "Name of the NSG to add ingress rule for Bastion to."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network the bastion host and subnet will reside in."
  type        = string
}

variable "address_prefix" {
  description = "CIDR to assign to the bastion subnet."
  type        = string
}
