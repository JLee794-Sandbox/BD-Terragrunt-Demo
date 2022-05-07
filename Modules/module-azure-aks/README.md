# module-azure-aks

Terraform module to provision a [Azure Kubernetes Service](<https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes>).

## Usage

```HCL
module "aks" {
  source                       = "./../module-azure-aks"
  resource_group_name          = "rg-rnd-uis-dev-eastus-01"
  name                         = "rnd-uis-dev-eastus-01"
  location                     = "eastus"
  keyvault_name                = kvrnduisdeus01
  keyvault_resource_group_name = rg-rnd-uis-dev-eastus-01
  vnet_subnet_id               = "/subscriptions/8cc6b0e7-e341-4103-bed6-574d6b298337/resourceGroups/rg-uis-infra-dev-eastus-001/providers/Microsoft.Network/virtualNetworks/vnet-uis-infra-dev-eastus-001/subnets/default"

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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| resource_group_name | The name of the Resource Group where AKS will be located | string | n/a | yes |
| name | The name of the AKS, prefix "aks-" will be added at the beginning automatically via terraform according to naming convention | string | n/a | yes |
| location | Specifies the supported Azure location where AKS will be created. | string | eastus | yes |
| dns_prefix | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. | string |uis-dev-001| yes |
| kubernetes_version | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | string | 1.19.3 | no |
| pool_name |  The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created. | string | default | yes |
| node_count | The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100 and between min_count and max_count. | string | "1" | no |
| vm_size |The size of the Virtual Machine| string | Standard_DS2_v2 | yes |
| vnet_subnet_id | The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created.NOTE:A Route Table must be configured on this Subnet. | string | n/a | no |
| network_plugin |Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. | string | azure | yes |
| enable_auto_scaling | Should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false. | string | false | no |
| max_count | "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | string | 3 | no |
| min_count | The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100. | string | 1 | no |
| admin_username | The Public SSH Key used to access the cluster. Changing this forces a new resource to be created. | string | bd_admin | no |
| availability_zones | A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created. | list | null | no |
| service_cidr | Network range used by the Kubernetes service. | string | null | no |
| dns_service_ip | IP address within the Kubernetes service address range used by cluster service discovery (kube-dns). | string | null | no |
| docker_bridge_cidr |  IP address (in CIDR notation) used as the Docker bridge IP address on nodes. | string | null | no |
| keyvault_name |  example: kvuisinfradeus001 - Specifies the name of the Key Vault where SSH key and KEK is stored. | string | n/a | yes |
| keyvault_resource_group_name |  example: rg-uis-infra-dev-eastus-001 - The name of the Resource Group in which the Key Vault exists. | string | n/a | yes |
| oms_agent_enabled | Enable Cluster Monitoring. | string | false | no |
| log_analytics_workspace_id | The ID of the Log Analytics Workspace which the OMS Agent should send data to. | string | null | no |
| node_resource_group | The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created. | string | n/a | no |


## Outputs

| Name | Description |
|------|-------------|
| id | AKS instance id. |
| name | AKS instance name.|
| location | AKS instance location.|
| host | AKS instance host name |
| node_resource_group | Name of the Resource group where the kubernetes nodes should exist.|
| raw_kube_config | Raw Kubernetes config to be used by kubectl and other compatible tools.|
| client_certificate | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.|
| cluster_ca_certificate | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.|
| username | username used to authenticate to the Kubernetes cluster.|
| identity_principal_id | The Principal ID for the Service Principal associated with the Identity of this AKS|
| outbound_ip_ids | Resource IDs of AKS outbound Public IP address|
| outbound_ip_address | Outbound public Ip address of AKS |

## Changelog

### v 1.0.0 2020-11-20

* Initial version

### v 0.0.1 2020-01-20

* Added static outbound IP address

### v 1.0.0 2021-02-22

* Added AddOn Profile block.


### v 1.0.0 2021-03-09

* Fix Aks resources group name.

### v 1.0.0 2021-05-13

* Added node_resource_group output.
