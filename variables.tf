variable "prefix" {
  description = "Name prefix for all resources"
  type        = string
  default     = "tfvm"
}


variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}


variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}


variable "ssh_public_key_path" {
  description = "ABSOLUTE path to your SSH public key file (.pub)"
  type        = string
}


variable "vm_size" {
  description = "VM size (free‑tier friendly: Standard_B1s)"
  type        = string
  default     = "Standard_B1s"
}