# module-azure-naming

Terraform module to build proper naming based on naming and tagging convension.

## Usage

```HCL
module "azure_naming" {
  source            = "./../modules/module-azure-naming"
  business_unit     = "rnd"
  product           = "uis"
  environment       = "shared"
  location          = "eastus"
  alteration        = "01"
  cost_center       = "center1"
  const_center_name = "const-center1"

  tags = {
    "Confidentiality" : "private"
    "SLA" : "24hours"
    "BusinessImpact" : "Moderate"
    "BusinessProcess" : "Support"
    "RevenueImpact" : "High"
    "ManagedBy" : "DevOps"
  }
}
```

## Module Details

This module creates an null resources with correct short and full naming.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alteration | Example of alteration: you spawn 2x UIS environments in the same environment first alteration of the default deployment/environment = 01 second alteration of the deployment/environment = 02 | string | n/a | yes |
| environment | Environment name -	example:prod/preprod/dev/test | string | n/a | yes |
| location | location - example: East US (Virginia) - eu | string | n/a | yes |
| product | Product	name - example: UIS | string | n/a | yes |
| business_unit | Business Unit name - example: rnd/mnf/gcs/mkt | string | n/a | yes |
| cost_center | Allows resource to be associated with specific groups and owners within an organization for billing and finance manageability purposes | string | n/a | yes |
| const_center_name | Allows resource to be associated with specific groups and owners within an organization for billing and finance manageability purposes | string | n/a | yes |
| delimiter | Delimiter to be used between `name`, etc. | string | `"-"` | no |
| tags | Additional tags (e.g. `map('BusinessImpact`,`Moderate`) | map | `<map>` | no |
| function | Function name | string | `""` | no |
## Outputs

| Name | Description |
|------|-------------|
| alteration | Lowercased alteration. |
| environment | Lowercased environment. |
| business_unit | Lowercased business unit. |
| product | Lowercased product. |
| function | Lowercased function. |
| cost_center | Lowercased cost center. |
| const_center_name | Lowercased const center name. |
| location | Lowercased Azure location. |
| name | Lowercased Environment, Solution, Location, Alteration name splatted by dash. |
| short\_environment | Short version. Lowercased environment. |
| short\_location | Short version. Lowercased Azure location. |
| short\_name | Short version. Lowercased Environment, Solution, Location, Alteration name. |
| tags | Merge input tags with our tags. |

## Changelog

### v 1.0.0 2020-11-10

* Initial version

### v 1.1.0 2020-11-19

* Incorporated naming and tagging convention
