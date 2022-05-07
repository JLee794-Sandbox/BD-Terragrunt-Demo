# Location list and its assertion
# The short location set according to name conventions.
variable "location_list" {
  description = "Location"
  type        = list
  default     = ["eastus", "westus", "eastus2"]
}

variable "short_location_names" {
  type = map

  default = {
    "eastus"  = "eus"
    "westus"  = "wus"
    "eastus2" = "eus2"
  }
}

# Business Unit names list and its assertion
variable "business_unit_list" {
  description = "Business Unit name"
  type        = list
  default     = ["rnd", "mnf", "gcs", "mkt"]
}

# Product names list and its assertion
# The short product names set according to name conventions.
variable "product_list" {
  description = "Product name"
  type        = list
  default     = ["uis", "da", "uia", "cce"]
}

# Environment names list and its assertion
# The short environment names set according to name conventions.
variable "environment_list" {
  description = "Environment name"
  type        = list
  default     = ["prd", "dev", "stg", "tst", "shared", "devops", "local", "system-integration"]
}

variable "short_environment_names" {
  type = map
  default = {
    "prod"   = "p"
    "dev"    = "d"
    "stg"    = "st"
    "test"   = "t"
    "shared" = "sh"
    "devops" = "ds"
    "local"  = "l"
    "system-integration" = "si"
  }
}

resource "null_resource" "short_label" {
  triggers = {
    short_business_unit = lower(format("%v", var.business_unit))
    short_product       = lower(format("%v", var.product))
    short_function      = lower(format("%v", var.function))
    short_environment   = lower(format("%v", var.short_environment_names[var.environment]))
    short_location      = lower(format("%v", var.short_location_names[var.location]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "null_resource" "label" {
  triggers = {
    name              = lower(join(var.delimiter, compact(concat(tolist([var.business_unit, var.product, var.function, var.environment, var.location, var.alteration])))))
    short_name        = lower(join("", compact(concat(tolist([null_resource.short_label.triggers.short_business_unit, null_resource.short_label.triggers.short_product, null_resource.short_label.triggers.short_function, null_resource.short_label.triggers.short_environment, null_resource.short_label.triggers.short_location, var.alteration])))))
    business_unit     = lower(format("%v", var.business_unit))
    product           = lower(format("%v", var.product))
    function          = lower(format("%v", var.function))
    environment       = lower(format("%v", var.environment))
    alteration        = lower(format("%v", var.alteration))
    location          = lower(format("%v", var.location))
    cost_center       = lower(format("%v", var.cost_center))
    const_center_name = lower(format("%v", var.const_center_name))
  }

  lifecycle {
    create_before_destroy = true
  }
}
