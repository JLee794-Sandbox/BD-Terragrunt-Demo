# module-azure-key-vault

Terraform module to provision a [Key Vault](<https://docs.microsoft.com/en-in/azure/key-vault/>).

## Usage

```HCL
module "key_vault" {
  source                      = "./../module-azure-key-vault"
  name                        = "uisinfradeus001"
  location                    = "eastus"
  resource_group_name         = "rg-uis-infra-dev-eastus-001"
  virtual_network_subnet_ids  = ["/subscriptions/0e4024d6-f954-443d-9342-7b40c50c5bb5/resourceGroups/rg-uis-infra-dev-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-uis-infra-dev-eastus-001/subnets/sneti-uis-infra-dev-eastus-001"]
}
```

If needed here is a way to disable soft-delete and/or purge-protection by adding next variables:

```HCL
...
  enable_purge_protection = false
  enable_soft_delete = false
...
```

## Module Details

This module:

* Creates a Azure Key Vault with settings to be use for SSE and ADE encryption
* Sets initial admins (key_vault_admins_object_ids variable).
* Sets initial IP whitlisting for access outside of Azure internal services.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ip\_rules | The list of IP CIRDs to initially grant access to KeyVault | list | ["0.0.0.0/0"] | yes |
| key\_vault\_admins\_object\_ids | Object Ids needing admin access to the Key Vault | list | "00465881-6c91-4442-85a1-66609b5ab444", "00465881-6c91-4442-85a1-66609b5ab444" | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | eastus | yes |
| name | Specifies the name of the Key Vault. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the Key Vault. | string | n/a | yes |
| tenant\_id | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | string | "94c3e67c-9e2d-4800-a6b7-635d97882165" | yes |
| enable\_purge\_protection | The switch to enable purge-protection property for KeyVault | string | `"true"` | no |
| enabled\_for\_deployment | Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | string | `"false"` | no |
| enabled\_for\_disk\_encryption | Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | string | `"true"` | no |
| enabled\_for\_template\_deployment | Azure Resource Manager is permitted to retrieve secrets from the key vault. | string | `"false"` | no |
| key\_vault\_keyreaders\_object\_ids | Object Ids needing Key read access to the Key Vault | list | "84a10e8e-e3f5-4dda-83a6-d1dbaa4af623" | no |
| keyreaders\_vault\_cert\_permissions | Cert Permissions for KeyVault Key Readers | list | `<list>` | no |
| keyreaders\_vault\_key\_permissions | Key Permissions for KeyVault Key Readers | list | `<list>` | no |
| keyreaders\_vault\_secret\_permissions | Secret Permissions for KeyVault Key Readers | list | `<list>` | no |
| network\_acls\_bypass | Sets which traffic can bypass the network rules. | string | `"AzureServices"` | no |
| network\_acls\_default\_action | The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. | string | `"Deny"` | no |
| sku | The Name of the SKU used for this Key Vault. | string | `"standard"` | no |
| tags | A mapping of tags to assign to resource group | map | `<map>` | no |
| vault\_cert\_permissions | Cert Permissions | list | `<list>` | no |
| vault\_key\_permissions | Key Permissions | list | `<list>` | no |
| vault\_secret\_permissions | Secret Permissions | list | `<list>` | no |
| virtual\_network\_subnet\_ids | One or more Subnet ID's which should be able to access this Key Vault. | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| vuault_name | The name of the Key Vault |
| vault\_id | The ID of the Key Vault. |
| vault\_uri | The URI of the Key Vault, used for performing operations on keys and secrets. |
| vault_resource_group_name | The resource group name where key vault located |

### v 0.0.1 2020-11-19

* Initial version
