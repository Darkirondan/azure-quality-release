module "resource_group" {
  source         = "./modules/resource_group"
  resource_group = var.resource_group
  # location       = var.location
}

module "network" {
  source               = "./modules/network"
  address_space        = var.address_space
  location             = var.location
  virtual_network_name = var.virtual_network_name
  application_type     = var.application_type
  resource_type        = "NET"
  resource_group       = var.resource_group //module.resource_group.resource_group_name
  address_prefix_test  = var.address_prefix_test
}

module "nsg" {
  source              = "./modules/nsg"
  location            = var.location
  application_type    = var.application_type
  resource_type       = "NSG"
  resource_group      = var.resource_group //module.resource_group.resource_group_name
  subnet_id           = module.network.subnet_id_test
  address_prefix_test = var.address_prefix_test
}
module "appservice" {
  source           = "./modules/appservice"
  location         = var.location
  application_type = var.application_type
  resource_type    = "AppService"
  resource_group   = var.resource_group //module.resource_group.resource_group_name
}
module "publicip" {
  source           = "./modules/publicip"
  location         = var.location
  application_type = var.application_type
  resource_type    = "publicip"
  resource_group   = var.resource_group //module.resource_group.resource_group_name
  mysubnetid       = module.network.subnet_id_test
}

module "security" {
  source = "./modules/security"

}

module "vm" {
  source               = "./modules/vm"
  rg                   = var.resource_group
  location             = var.location
  network_interface_id = module.publicip.NICid
  ssh_key              = module.security.ssh
}
