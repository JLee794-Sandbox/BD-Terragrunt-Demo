
variable "business_unit" {
  description = "Business Unit name - example: rnd/mnf/gcs/mkt"
  type        = string
}

variable "product" {
  description = "Product name - example: UIS"
  type        = string
}

variable "function" {
  description = "Function name"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment name -	example:prod/stage/dev/test"
  type        = string
}

variable "location" {
  description = "location - example: East US (Virginia) - eus"
  type        = string
}

variable "alteration" {
  description = "Example of alteration: you spawn 2x UIS environments in the same environment first alteration of the default deployment/environment = 01 second alteration of the deployment/environment = 02"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `name`, etc."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "cost_center" {
  description = "Allows resource to be associated with specific groups and owners within an organization for billing and finance manageability purposes"
  type        = string
}

variable "const_center_name" {
  description = "Allows resource to be associated with specific groups and owners within an organization for billing and finance manageability purposes"
  type        = string
}
