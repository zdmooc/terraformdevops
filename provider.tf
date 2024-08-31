terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = data.azurerm_key_vault_secret.client_secret.value
  tenant_id       = var.tenant_id
  features        = {}
}

data "azurerm_key_vault" "azdevopsterraformkey" {
  name                = "azdevopsterraformkey"
  resource_group_name = "votre-resource-group"  # Remplacez par le nom de votre Resource Group
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = "client-secret"
  key_vault_id = data.azurerm_key_vault.azdevopsterraformkey.id
}
