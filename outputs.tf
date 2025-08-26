output "public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IP of the VM"
}


output "ssh_command" {
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.pip.ip_address} -i ${var.ssh_public_key_path}"
  description = "Copy/paste this to connect via SSH"
}