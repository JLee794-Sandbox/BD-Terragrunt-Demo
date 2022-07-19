# module-generate-passwords-for-kv

Terraform module to generate a random password and insert into key vault

## Usage

```HCL
module "generate_passwords_for_kv" {
  source                      = "./../module-generate-passwords-for-kv"
  key_vault_id                = <key_vault_id>
  secret_name                 = sqluserpw
  password_length             = 16
  min_lower                   = 1
  min_numeric                 = 1
  min_special                 = 1
  min_upper                   = 1
  include_numbers             = true
  include_upper               = true
  include_lower               = true
  include_special_characters  = true
  override_special            = "!@#$"
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| key_vault_id | ID of key vault | string | n/a | yes |
| secret_name | Name of the secret | string | n/a | yes |
| password_length | Length of the password | number | 16 | yes |
| min_lower | Minimum number of lowercase alphabet characters in the password | number | 1 | yes |
| min_numeric | Minimum number of numeric characters in the password | number | 1 | yes |
| min_special | Minimum number of special characters in the password | number | 1 | yes |
| min_upper | Minimum number of uppercase alphabet characters in the password | number | 1 | yes |
| include_numbers | Include numbers in password | bool | true | yes |
| include_upper | Include uppercase alphabet characters in password | bool | true | yes |
| include_lower | Include lowercase alphabet characters in password | bool | true | yes |
| include_special_characters | Include special characters in password | bool | true | yes |
| override_special | Override special characters | string | !@#$ | yes |

## Outputs

| Name | Description |
|------|-------------|

## Changelog

### v 1.0.0 2021-05-25

* Initial version
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.vault-secret-password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [random_password.random-generated-password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_include_lower"></a> [include\_lower](#input\_include\_lower) | Include lowercase alphabet characters in password | `bool` | `true` | no |
| <a name="input_include_numbers"></a> [include\_numbers](#input\_include\_numbers) | Include numbers in password | `bool` | `true` | no |
| <a name="input_include_special_characters"></a> [include\_special\_characters](#input\_include\_special\_characters) | Include special characters in password | `bool` | `true` | no |
| <a name="input_include_upper"></a> [include\_upper](#input\_include\_upper) | Include uppercase alphabet characters in password | `bool` | `true` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | ID of key vault | `any` | n/a | yes |
| <a name="input_min_lower"></a> [min\_lower](#input\_min\_lower) | Minimum number of lowercase alphabet characters in the password | `number` | `1` | no |
| <a name="input_min_numeric"></a> [min\_numeric](#input\_min\_numeric) | Minimum number of numeric characters in the password | `number` | `1` | no |
| <a name="input_min_special"></a> [min\_special](#input\_min\_special) | Minimum number of special characters in the password | `number` | `1` | no |
| <a name="input_min_upper"></a> [min\_upper](#input\_min\_upper) | Minimum number of uppercase alphabet characters in the password | `number` | `1` | no |
| <a name="input_override_special"></a> [override\_special](#input\_override\_special) | Override special characters | `string` | `"!@#$"` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | Length of the password | `number` | `16` | no |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Name of the secret | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
