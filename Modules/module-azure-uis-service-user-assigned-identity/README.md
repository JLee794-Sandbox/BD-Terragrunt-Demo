# module-azure-uis-service-user-assigned-identity

Terraform module to provision a uis service user assigned identity [Azure Managed Identities](<https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview>).

## Usage

```HCL
module "azure_uis_service_user_assigned_identity" {
  source                       = "./../module-azure-uis-service-user-assigned-identity"
  resource_group_name          = "rg-rnd-uis-dev-eastus-01"
  name                         = "<uis-service-name>"
  location                     = "eastus"
  subscription_id              = "<subscription-id>"
  aks_node_resource_group      = "<aks-node-resource-group>"

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

This module creates a user assigned identity for a uis service and assigns a reader role to the resource group where the kubernetes nodes should exist.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group where the user assigned identity will be located | string | n/a | yes |
| name | The name of the user assigned identity | string | n/a | yes |
| location | Specifies the supported Azure location where the user assigned identity is created. | string | eastus | yes |
| subscription_id | Subscription id | string | n/a | yes |
| aks_node_resource_group | The name of the resource group where the kubernetes nodes should exist | string | n/a | yes |
| key_vault_id | ID of the key vault | string | n/a | yes |
| tags | A mapping of tags to assign to the resource. | list | {} | no |


## Outputs

| Name | Description |
|------|-------------|
| uis_service_user_assigned_identity_reader_role_aks_nodes_id | Role assignment ID for uis service reader role for resource group where the kubernetes nodes should exist |
| uis_service_user_assigned_identity_id | MSSQL elastic pool ID |
| uis_service_user_assigned_identity_principal_id | Service principal id associated with the user assigned identity |
| uis_service_user_assigned_identity_client_id | Client id associated with the user assigned identity |

## Changelog

### v 0.0.1 2021-05-13

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
| [azurerm_key_vault_access_policy.service_key_vault_access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_user_assigned_identity.service_user_assigned_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_node_resource_group"></a> [aks\_node\_resource\_group](#input\_aks\_node\_resource\_group) | Name of the resource group where the kubernetes nodes should exist | `string` | `""` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | ID of the key vault | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | User assigned identity resource location | `string` | `"eastus"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the user assigned identity | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription id | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the user identity | `map` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant id | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_uis_service_user_assigned_identity_client_id"></a> [uis\_service\_user\_assigned\_identity\_client\_id](#output\_uis\_service\_user\_assigned\_identity\_client\_id) | Client id associated with the user assigned identity |
| <a name="output_uis_service_user_assigned_identity_id"></a> [uis\_service\_user\_assigned\_identity\_id](#output\_uis\_service\_user\_assigned\_identity\_id) | User assigned identity id |
| <a name="output_uis_service_user_assigned_identity_principal_id"></a> [uis\_service\_user\_assigned\_identity\_principal\_id](#output\_uis\_service\_user\_assigned\_identity\_principal\_id) | Service principal id associated with the user assigned identity |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
