output "name" {
  value       = null_resource.label.triggers.name
  description = "Lowercased Environment, Solution, Location, Alteration name splatted by dash."
}

output "short_name" {
  value       = null_resource.label.triggers.short_name
  description = "Short version. Lowercased Environment, Solution, Location, Alteration name"
}

output "environment" {
  value       = null_resource.label.triggers.environment
  description = "Lowercased environment."
}

output "short_environment" {
  value       = null_resource.short_label.triggers.short_environment
  description = "Short version. Lowercased environment."
}

output "business_unit" {
  value       = null_resource.label.triggers.business_unit
  description = "Lowercased business unit."
}

output "product" {
  value       = null_resource.label.triggers.product
  description = "Lowercased product."
}

output "function" {
  value       = null_resource.label.triggers.function
  description = "Lowercased function."
}

output "cost_center" {
  value       = null_resource.label.triggers.function
  description = "Lowercased cost center."
}

output "const_center_name" {
  value       = null_resource.label.triggers.function
  description = "Lowercased const center name."
}

output "alteration" {
  value       = null_resource.label.triggers.alteration
  description = "Lowercased alteration."
}

output "location" {
  value       = null_resource.label.triggers.location
  description = "Lowercased Azure location."
}

output "short_location" {
  value       = null_resource.short_label.triggers.short_location
  description = "Short version. Lowercased Azure location."
}

# Merge input tags with our tags.
output "tags" {
  value = merge(
    {
      "CostCenter"      = null_resource.label.triggers.cost_center,
      "ConstCenterName" = null_resource.label.triggers.const_center_name,
      "Department"      = null_resource.label.triggers.business_unit,
      "Product"         = null_resource.label.triggers.product,
      "Environment"     = null_resource.label.triggers.environment,
      "Location"        = null_resource.label.triggers.location,
    }, var.tags
  )
}
