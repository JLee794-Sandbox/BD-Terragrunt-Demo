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
