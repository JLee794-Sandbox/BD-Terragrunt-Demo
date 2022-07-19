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
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.label](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.short_label](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alteration"></a> [alteration](#input\_alteration) | Example of alteration: you spawn 2x UIS environments in the same environment first alteration of the default deployment/environment = 01 second alteration of the deployment/environment = 02 | `any` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Business Unit name - example: rnd/mnf/gcs/mkt | `string` | n/a | yes |
| <a name="input_business_unit_list"></a> [business\_unit\_list](#input\_business\_unit\_list) | Business Unit name | `list` | <pre>[<br>  "rnd",<br>  "mnf",<br>  "gcs",<br>  "mkt"<br>]</pre> | no |
| <a name="input_const_center_name"></a> [const\_center\_name](#input\_const\_center\_name) | Allows resource to be associated with specific groups and owners within an organization for billing and finance manageability purposes | `string` | n/a | yes |
| <a name="input_cost_center"></a> [cost\_center](#input\_cost\_center) | Allows resource to be associated with specific groups and owners within an organization for billing and finance manageability purposes | `string` | n/a | yes |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between `name`, etc. | `string` | `"-"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name -	example:prod/stage/dev/test | `string` | n/a | yes |
| <a name="input_environment_list"></a> [environment\_list](#input\_environment\_list) | Environment name | `list` | <pre>[<br>  "prd",<br>  "dev",<br>  "stg",<br>  "tst",<br>  "shared",<br>  "devops",<br>  "local",<br>  "system-integration"<br>]</pre> | no |
| <a name="input_function"></a> [function](#input\_function) | Function name | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | location - example: East US (Virginia) - eus | `string` | n/a | yes |
| <a name="input_location_list"></a> [location\_list](#input\_location\_list) | Location | `list` | <pre>[<br>  "eastus",<br>  "westus",<br>  "eastus2"<br>]</pre> | no |
| <a name="input_product"></a> [product](#input\_product) | Product name - example: UIS | `string` | n/a | yes |
| <a name="input_product_list"></a> [product\_list](#input\_product\_list) | Product name | `list` | <pre>[<br>  "uis",<br>  "da",<br>  "uia",<br>  "cce"<br>]</pre> | no |
| <a name="input_short_environment_names"></a> [short\_environment\_names](#input\_short\_environment\_names) | n/a | `map` | <pre>{<br>  "dev": "d",<br>  "devops": "ds",<br>  "local": "l",<br>  "prod": "p",<br>  "shared": "sh",<br>  "stg": "st",<br>  "system-integration": "si",<br>  "test": "t"<br>}</pre> | no |
| <a name="input_short_location_names"></a> [short\_location\_names](#input\_short\_location\_names) | n/a | `map` | <pre>{<br>  "eastus": "eus",<br>  "eastus2": "eus2",<br>  "westus": "wus"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alteration"></a> [alteration](#output\_alteration) | Lowercased alteration. |
| <a name="output_business_unit"></a> [business\_unit](#output\_business\_unit) | Lowercased business unit. |
| <a name="output_const_center_name"></a> [const\_center\_name](#output\_const\_center\_name) | Lowercased const center name. |
| <a name="output_cost_center"></a> [cost\_center](#output\_cost\_center) | Lowercased cost center. |
| <a name="output_environment"></a> [environment](#output\_environment) | Lowercased environment. |
| <a name="output_function"></a> [function](#output\_function) | Lowercased function. |
| <a name="output_location"></a> [location](#output\_location) | Lowercased Azure location. |
| <a name="output_name"></a> [name](#output\_name) | Lowercased Environment, Solution, Location, Alteration name splatted by dash. |
| <a name="output_product"></a> [product](#output\_product) | Lowercased product. |
| <a name="output_short_environment"></a> [short\_environment](#output\_short\_environment) | Short version. Lowercased environment. |
| <a name="output_short_location"></a> [short\_location](#output\_short\_location) | Short version. Lowercased Azure location. |
| <a name="output_short_name"></a> [short\_name](#output\_short\_name) | Short version. Lowercased Environment, Solution, Location, Alteration name |
| <a name="output_tags"></a> [tags](#output\_tags) | Merge input tags with our tags. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
