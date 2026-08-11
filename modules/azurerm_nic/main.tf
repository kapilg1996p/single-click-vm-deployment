data "azurerm_subnet" "subnet" {
  for_each             = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

}

data "azurerm_public_ip" "pip" {
  for_each            = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.nic-name
  location            = each.value.nic-location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = "internal"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
  }
}