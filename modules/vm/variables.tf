variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "subnet_id" { type = string }
variable "nsg_id" { type = string, default = "" }
variable "admin_username" { type = string }
variable "ssh_public_key_path" { type = string }
variable "vm_size" { type = string, default = "Standard_B1s" }
variable "create_public_ip" { type = bool, default = true }
variable "tags" { type = map(string) default = {} }
