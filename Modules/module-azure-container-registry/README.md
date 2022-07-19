# module-azure-container-registry

Terraform module to provision a [Azure Container Registry](<https://docs.microsoft.com/en-us/azure/container-registry/>).

## Usage

```HCL
module "acr" {
  source              = "./../module-azure-container-registry"
  resource_group_name =  "rg-rnd-uis-shared-eastus-01"
  name                = "acrrnduissheus01"
  location            = "eastus"
  acr_sku_name        = "Basic"

  tags = {
    "Confidentiality" : "private"
    "SLA"             : "24hours"
    "BusinessImpact"  : "Moderate"
    "BusinessProcess" : "Suppor"
    "RevenueImpact"   : "High"
    "ManagedBy"       : "DevOps"
  }
}

```
## Module Details

This module creates an Azure Container Registry to be used to store images.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group | string | n/a | yes |
| name | The name of the Azure Container Registry, prefix "acr" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where the Azure Container Registry will be created. | string | eastus | yes |
| admin_enabled | Is the Administrator account enabled for this Container Registry. | string | false | no |
| sku | The SKU name of the container registry. Possible values are Basic, Standard and Premium | string | Basic | yes |
| georeplication_locations |  (Optional) A list of Azure locations where the container registry should be geo-replicated. Available only in Premuim SKU | list | East US2 | no |
| tags | A mapping of tags assigned to the Azure Container Registry | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Azure Container Registry. |
| login_server | The URL that can be used to log into the container registry.|
| admin_username | The Username associated with the Container Registry Admin account - if the admin account is enabled.|

## Changelog

### v 0.0.1 2020-11-10

* Initial version
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | Specifies whether the admin user is enabled | `bool` | `null` | no |
| <a name="input_georeplication_locations"></a> [georeplication\_locations](#input\_georeplication\_locations) | A list of Azure locations where the container registry should be geo-replicated. | `list` | <pre>[<br>  "East US2"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | Resource group location | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Container Registry | `any` | n/a | yes |
| <a name="input_network_rule_set"></a> [network\_rule\_set](#input\_network\_rule\_set) | (Optional) A network\_rule\_set block as documented below. | `list` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU name of the container registry. Possible values are Basic, Standard and Premium | `string` | `"Basic"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resource group | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_login_server"></a> [login\_server](#output\_login\_server) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
