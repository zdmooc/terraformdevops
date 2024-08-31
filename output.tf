output "resource_group_name" {
  value = azurerm_resource_group.azdevops.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.azdevops.id
}

output "vm_public_ip" {
  value = azurerm_linux_virtual_machine.azdevops.public_ip_address
}
