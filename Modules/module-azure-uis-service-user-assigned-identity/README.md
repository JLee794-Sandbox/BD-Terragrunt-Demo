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
