variable "location" { default = "eastus" }
variable "prefix" { default = "opella-dev" }
variable "tags" { type = map(string) default = { project = "opella", env = "dev" } }

module "rg" {
  source   = "../../modules/resource_group"
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = var.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = "${var.prefix}-vnet"
  location            = module.rg.location
  resource_group_name = module.rg.name
  address_space       = ["10.10.0.0/16"]
  subnets             = [ { name = "app", prefix = "10.10.1.0/24" } ]
  tags                = var.tags
}

module "nsg" {
  source              = "../../modules/nsg"
  name                = "${var.prefix}-nsg"
  location            = module.rg.location
  resource_group_name = module.rg.name
  tags                = var.tags
  rules = [
    {
      name = "Allow-SSH"
      priority = 1001
      direction = "Inbound"
      access = "Allow"
      protocol = "Tcp"
      source_port_range = "*"
      destination_port_range = "22"
      source_address_prefixes = ["0.0.0.0/0"]
      destination_address_prefix = "*"
    }
  ]
}

module "vm" {
  source              = "../../modules/vm"
  name                = "${var.prefix}-vm01"
  location            = module.rg.location
  resource_group_name = module.rg.name
  subnet_id           = module.vnet.subnet_ids["app"]
  nsg_id              = module.nsg.nsg_id
  admin_username      = "azureuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  vm_size             = "Standard_B1s"
  create_public_ip    = true
  tags                = var.tags
}
