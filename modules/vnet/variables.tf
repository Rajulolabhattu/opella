variable "name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "address_space" { type = list(string) default = ["10.0.0.0/16"] }
variable "subnets" { type = list(object({ name = string, prefix = string })) default = [{ name = "default", prefix = "10.0.1.0/24" }] }
variable "tags" { type = map(string) default = {} }
