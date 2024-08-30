# outputs.tf
output "key_vault_id" {
  value = azurerm_key_vault.azdevops.id
}

output "resource_group_name" {
  value = azurerm_resource_group.azdevops.name
}



output "virtual_machine_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.example.id
}
