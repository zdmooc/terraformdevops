# main.tf
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "azdevops" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "azdevops" {
  name                        = "azdevops-vault"
  location                    = azurerm_resource_group.azdevops.location
  resource_group_name         = azurerm_resource_group.azdevops.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_enabled         = true
  purge_protection_enabled    = true

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.client_id  # L'objet Azure AD associé au client_id
    permissions {
      secrets = [
        "get",
        "list",
      ]
    }
  }
}

# Autres ressources Azure pour le projet AZ-900
# Ajoutez ici les configurations pour VMs, Storage Accounts, ou autres services nécessaires




resource "azurerm_resource_group" "azdevops" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "azdevops" {
  name                = "azdevops-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.azdevops.location
  resource_group_name = azurerm_resource_group.azdevops.name
}

resource "azurerm_subnet" "azdevops" {
  name                 = "azdevops-subnet"
  resource_group_name  = azurerm_resource_group.azdevops.name
  virtual_network_name = azurerm_virtual_network.azdevops.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "azdevops" {
  name                = "azdevops-nic"
  location            = azurerm_resource_group.azdevops.location
  resource_group_name = azurerm_resource_group.azdevops.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.azdevops.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "azdevops" {
  name                = "azdevops-vm"
  location            = azurerm_resource_group.azdevops.location
  resource_group_name = azurerm_resource_group.azdevops.name
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "Password1234!"

  network_interface_ids = [
    azurerm_network_interface.azdevops.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
