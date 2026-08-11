module "resource_group" {
  source = "../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../modules/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"
  snats      = var.snats
}

module "pip" {
  depends_on = [module.resource_group]
  source     = "../modules/azurerm_public_ip"
  pip        = var.pip
}

module "nic" {
  depends_on = [module.subnet, module.pip]
  source     = "../modules/azurerm_nic"
  nic        = var.nic
}

module "linux_virtual_machine" {
  depends_on = [module.nic]
  source     = "../modules/azurerm_vm"
  vms        = var.vms
}