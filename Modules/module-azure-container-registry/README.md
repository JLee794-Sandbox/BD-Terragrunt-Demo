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
