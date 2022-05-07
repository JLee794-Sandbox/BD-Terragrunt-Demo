variable "key_vault_id" {
  description = "ID of key vault"
}

variable "secret_name" {
  description = "Name of the secret"
}

variable "password_length" {
  description = "Length of the password"
  default     = 16
}

variable "min_lower" {
  description = "Minimum number of lowercase alphabet characters in the password"
  default     = 1
}

variable "min_numeric" {
  description = "Minimum number of numeric characters in the password"
  default     = 1
}

variable "min_special" {
  description = "Minimum number of special characters in the password"
  default     = 1
}

variable "min_upper" {
  description = "Minimum number of uppercase alphabet characters in the password"
  default     = 1
}

variable "include_numbers" {
  description = "Include numbers in password"
  default     = true
}

variable "include_upper" {
  description = "Include uppercase alphabet characters in password"
  default     = true
}

variable "include_lower" {
  description = "Include lowercase alphabet characters in password"
  default     = true
}

variable "include_special_characters" {
  description = "Include special characters in password"
  default     = true
}

variable "override_special" {
  description = "Override special characters"
  default     = "!@#$"
}
