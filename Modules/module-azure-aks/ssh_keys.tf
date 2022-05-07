resource "tls_private_key" "ssh_aks" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "azurerm_key_vault_secret" "ssh_pub_aks" {
  name         = lower(join("", ["aks-", format("%v", var.name), "-pub"]))
  value        = tls_private_key.ssh_aks.public_key_openssh
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "ssh_private_aks" {
  name         = lower(join("", ["aks-", format("%v", var.name), "-prvt"]))
  value        = tls_private_key.ssh_aks.private_key_pem
  key_vault_id = var.keyvault_id
}
