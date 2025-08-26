output "vm_id" { value = azurerm_linux_virtual_machine.this.id }
output "nic_id" { value = azurerm_network_interface.this.id }
output "public_ip" { 
  value = length(azurerm_public_ip.this) > 0 ? azurerm_public_ip.this[0].ip_address : "" 
}
