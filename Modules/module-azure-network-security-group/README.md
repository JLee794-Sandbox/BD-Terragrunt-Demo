# module-azure-network-security-group

Terraform module to provision a [Network Security Group](<https://docs.microsoft.com/en-us/azure/virtual-network/security-overview>). A security group will be created with blocked any connections, to allow any inbound or outbound connection, use network_security_group_rule to add needed access.

## Usage

```HCL
module "network_security_group" {
  source                      = "./../modules/module-azure-network-security-group"
  name                        = "nsgi-uis-infra-dev-eus-001"
  location                    = "eastus"
  resource_group_name         = "rg-uis-infra-dev-eus-001"

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

This module creates an Azure Network Security Group to be used for managing inbound or outbound traffic rules for Application Security groups or virtual machines.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the Network Security Group | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| resource\_group\_name | The name of the resource group in which the Network Security Group will be created | string | n/a | yes |
| tags | A mapping of tags assigned to the Network Security Group resource | list | n/a | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Network Security Group |
| id | The ID of the Network Security Group. |
| location | The supported Azure location where the Network Security Group exists |
| resource\_group\_name | The name of the resource group in which the Network Security Group exists |

## Changelog

### v 1.0.0 2020-11-11

* Initial version
