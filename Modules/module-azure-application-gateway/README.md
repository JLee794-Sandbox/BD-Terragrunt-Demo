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
| [azurerm_application_gateway.application_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |
| [azurerm_network_security_rule.network_security_rule_AllowGatewayInternet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.network_security_rule_AllowHTTPSInternet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_web_application_firewall_policy.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/web_application_firewall_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_address_pool"></a> [backend\_address\_pool](#input\_backend\_address\_pool) | List of maps including backend services configurations | `list(any)` | n/a | yes |
| <a name="input_backend_address_pool_fqdns"></a> [backend\_address\_pool\_fqdns](#input\_backend\_address\_pool\_fqdns) | A list of FQDN's which should be part of the Backend Address Pool | `list(any)` | n/a | yes |
| <a name="input_backend_services"></a> [backend\_services](#input\_backend\_services) | List of maps including backend services configurations | `list(any)` | n/a | yes |
| <a name="input_custom_probes"></a> [custom\_probes](#input\_custom\_probes) | List of maps for custom probes for Web/Function Apps | `list(any)` | n/a | yes |
| <a name="input_frontend_ports"></a> [frontend\_ports](#input\_frontend\_ports) | List of maps including frontend ports configurations | `list(any)` | n/a | yes |
| <a name="input_gateway_ip_configuration_network_security_group_name"></a> [gateway\_ip\_configuration\_network\_security\_group\_name](#input\_gateway\_ip\_configuration\_network\_security\_group\_name) | Network security group name assigned to subnet | `any` | n/a | yes |
| <a name="input_gateway_ip_configuration_subnet_id"></a> [gateway\_ip\_configuration\_subnet\_id](#input\_gateway\_ip\_configuration\_subnet\_id) | Subnet ID | `any` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list with a single user managed identity id to be assigned to the Application Gateway | `list` | `[]` | no |
| <a name="input_inbound_whitelist_ips"></a> [inbound\_whitelist\_ips](#input\_inbound\_whitelist\_ips) | List of whitelisted IP address for HTTPS inbound | `string` | `"0.0.0.0"` | no |
| <a name="input_key_vault_secret_id"></a> [key\_vault\_secret\_id](#input\_key\_vault\_secret\_id) | Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Application Gateway location -	eastus | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Application Gateway name | `any` | n/a | yes |
| <a name="input_policy_settings_enabled"></a> [policy\_settings\_enabled](#input\_policy\_settings\_enabled) | Set to true to enable WAF on Application Gateway. | `bool` | `true` | no |
| <a name="input_policy_settings_mode"></a> [policy\_settings\_mode](#input\_policy\_settings\_mode) | Set to true to enable WAF on Application Gateway. | `string` | `"Prevention"` | no |
| <a name="input_ps_key_vault_secret_id"></a> [ps\_key\_vault\_secret\_id](#input\_ps\_key\_vault\_secret\_id) | Secret Id of (base-64 encoded unencrypted pfx) Secret or Certificate object stored in Azure KeyVault. | `any` | n/a | yes |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Public Ip allocation method - Static/Dynamic | `string` | `"Static"` | no |
| <a name="input_public_ip_ip_version"></a> [public\_ip\_ip\_version](#input\_public\_ip\_ip\_version) | The IP Version to use - IPv4/IPv6 | `string` | `"IPv4"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP - Basic/Standard | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `any` | n/a | yes |
| <a name="input_sku_capacity"></a> [sku\_capacity](#input\_sku\_capacity) | The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU | `number` | `2` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The Name of the SKU to use for this Application Gateway. Possible values are Standard\_Small, Standard\_Medium, Standard\_Large, Standard\_v2, WAF\_Medium, WAF\_Large, and WAF\_v2 | `string` | `"Standard_v2"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The Tier of the SKU to use for this Application Gateway. Possible values are Standard\_v2, WAF and WAF\_v2 | `string` | `"Standard_v2"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to Application Gateway | `map` | `{}` | no |
| <a name="input_trusted_root_certificate_path"></a> [trusted\_root\_certificate\_path](#input\_trusted\_root\_certificate\_path) | The file path of the Trusted Root Certificate which should be used. | `any` | n/a | yes |
| <a name="input_waf_configuration"></a> [waf\_configuration](#input\_waf\_configuration) | (required) list applicatin gateway waf\_configuration | `list` | `[]` | no |
| <a name="input_waf_enabled"></a> [waf\_enabled](#input\_waf\_enabled) | Set to true to enable WAF on Application Gateway. | `bool` | n/a | yes |
| <a name="input_waf_rule_set_version"></a> [waf\_rule\_set\_version](#input\_waf\_rule\_set\_version) | The Version of the Rule Set used for this Web Application Firewall. Possible values are 2.2.9, 3.0, 3.1, and 3.2. | `string` | `"3.1"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | A collection containing the availability zone to allocate resources in | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_address_pool_id"></a> [backend\_address\_pool\_id](#output\_backend\_address\_pool\_id) | n/a |
| <a name="output_frontend_fqdn"></a> [frontend\_fqdn](#output\_frontend\_fqdn) | n/a |
| <a name="output_frontend_ip_address"></a> [frontend\_ip\_address](#output\_frontend\_ip\_address) | n/a |
| <a name="output_frontend_ip_configuration_id"></a> [frontend\_ip\_configuration\_id](#output\_frontend\_ip\_configuration\_id) | n/a |
| <a name="output_gateway_ip_configuration_id"></a> [gateway\_ip\_configuration\_id](#output\_gateway\_ip\_configuration\_id) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
| <a name="output_ssl_certificate_id"></a> [ssl\_certificate\_id](#output\_ssl\_certificate\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
