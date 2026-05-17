resource "azurerm_resource_group" "main" {
  name     = "rg-${var.environment}"
  location = var.location
}

module "network" {
  source = "./modules/network"

  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
}

module "vm" {
  source = "./modules/vm"

  environment         = var.environment
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = module.network.subnet_id
  vm_size             = var.vm_size
}