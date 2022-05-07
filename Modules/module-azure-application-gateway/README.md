# module-azure-application-gateway

Terraform module to provision a [Application Gateway](<https://docs.microsoft.com/en-us/azure/application-gateway/overview>).

## Usage

```HCL
module "application_gateway" {
  source              = "./../modules/module-azure-application-gateway"
  name                        = "rnd-uis-dev-eastus-01"
  location                    = "eastus"
  resource_group_name         = "rg-rnd-uis-dev-eastus-01"

  tags = {
    "Confidentiality" : "private"
    "SLA"             : "24hours"
    "BusinessImpact"  : "Moderate"
    "BusinessProcess" : "Suppor"
    "RevenueImpact"   : "High"
    "ManagedBy"       : "DevOps"
  }

  sku_name     = "Standard_v2"
  sku_tier     = "Standard_v2"
  sku_capacity = 2

  gateway_ip_configuration_subnet_id = module.subnet_external.id
  gateway_ip_configuration_network_security_group_name = nsge-rnd-uis-dev-eastus-01

  backend_address_pool_fqdns = ["dev.uis.bd.com"]

  backend_http_settings_path            = "/"
  backend_http_settings_request_timeout = 60

  trusted_root_certificate_path = "root_cert.cer"

  web_http_host_name = "dev-uis.bd.com"
  api_http_host_name = "api.dev-uis.bd.com"
  auth_http_host_name = "auth.freddy-dev-uis.bd.com"

    frontend_ports = [
    {
      name = "HTTPS"
      port = "443"
    },
    {
      name = "HTTP"
      port = "80"
    }
  ]

  backend_services = [
    {
      internal_host_name = "dev-uis.bd.com"
      path = "/"
      internal_port = "443"
      internal_protocol = "HTTPS"
      public_host_name = "dev-uis.bd.com"
      frontend_protocol = "HTTPS"
      frontend_port_name = "HTTPS"
    },
    {
      internal_host_name = "api.dev-uis.bd.com"
      path = "/"
      internal_port = "80"
      internal_protocol = "HTTP"
      public_host_name = "api.dev-uis.bd.com"
      frontend_protocol = "HTTP"
      frontend_port_name = "HTTP"
    }
  ]

  inbound_whitelist_ips = "92.253.250.240,92.253.250.240"

}
```

## Module Details

This module creates an Azure Application Gateway, NSG rule, Public IP.


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the Application Gateway | string | n/a | yes |
| location | Specifies the supported Azure location where the resource will be created. | string | n/a | yes |
| resource\_group\_name | The name of the resource group | string | n/a | yes |
| zones | A collection containing the availability zone to allocate resources in | list | n/a | yes |
| tags | A mapping of tags assigned to the Application Gateway resource | list | n/a | no |
| public_ip_allocation_method | Public Ip of Application Gateway allocation method - Static/Dynamic | string | Static | no |
| public_ip_sku | The SKU of the Public IP - Basic/Standard | string | Standard | no |
| public_ip_ip_version | The IP Version to use - IPv4/IPv6 | string | IPv4 | no |
| sku_name | The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2 | string | Standard_v2 | no |
| sku_tier | The Tier of the SKU to use for this Application Gateway. Possible values are Standard_v2, WAF and WAF_v2 | string | Standard_v2 | no |
| sku_capacity | The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU | string | 2 | no |
| gateway_ip_configuration_subnet_id | Subnet ID | string | n/a | yes |
| gateway_ip_configuration_network_security_group_name | Network security group name assigned to subnet | string | n/a | yes |
| backend_address_pool_fqdns | A list of FQDN's which should be part of the Backend Address Pool | list | [] | yes |
| frontend_ports | List of maps including frontend ports configurations | list | [] | yes |
| backend_services | List of maps including backend services configurations | list | [] | yes |
| key_vault_secret_id | Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. | string | n/a | yes |
| inbound_whitelist_ips | List of whitelisted IP address for HTTPS inbound | string | "0.0.0.0" | no |
| custom_probes | Probes for Web/Function Apps | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | The name of the Application Gateway |
| id | The ID of the Application Gateway. |
| location | The supported Azure location where the Application Gateway exists |
| resource\_group\_name | The name of the resource group in which the Application Gateway exists |
| backend_address_pool_id | The ID of the Backend Address Pool |
| uai_id | The ID of User assigned identity |
| frontend_ip_configuration_id | The ID of the Frontend IP Configuration. |
| gateway_ip_configuration_id | The ID of the Gateway IP Configuration. |
| ssl_certificate_id | The ID of the SSL Certificate. |
| frontend_ip_address | Application Gateway public IP address |
| frontend_fqdn | Fully qualified domain name of the A DNS record associated with the Application Gateway public IP |

## Changelog

### v 1.0.0 2020-11-25

* Initial version

### v 1.0.1 2020-12-10

* Update backend configuration

### v 1.0.2 2020-12-14

* Update configuration and NSG rules

### v 1.0.3 2020-12-24

* Add multiple hosts support

### v 1.0.4 2020-12-24

* Add Freddy rules

### v 1.0.5 2020-12-24

* Add dynamic blocks
