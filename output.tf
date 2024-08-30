output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example.name
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.example.id
}
