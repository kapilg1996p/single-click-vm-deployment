data "azurerm_network_interface" "nic" {
  for_each = var.vms
  name = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

name = each.value.vm-name
location = each.value.vm-location
resource_group_name = each.value.resource_group_name
size = each.value.vm-size
network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]

admin_username = each.value.admin_username 
admin_password = each.value.admin_password
disable_password_authentication = false

source_image_reference {
  publisher = each.value.publisher
  sku = each.value.sku
  version = each.value.version
  offer = each.value.offer

}
os_disk {
  name = each.value.os-disk-name
  caching = "ReadWrite"
  storage_account_type = each.value.storage_account_type
}
}