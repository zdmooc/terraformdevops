# secrets.tf
data "azurerm_key_vault_secret" "client_secret" {
  name         = "client-secret"
  key_vault_id = azurerm_key_vault.azdevops.id
}

data "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscription-id"
  key_vault_id = azurerm_key_vault.azdevops.id
}

data "azurerm_key_vault_secret" "tenant_id" {
  name         = "tenant-id"
  key_vault_id = azurerm_key_vault.azdevops.id
}

data "azurerm_key_vault_secret" "client_id" {
  name         = "client-id"
  key_vault_id = azurerm_key_vault.azdevops.id
}
