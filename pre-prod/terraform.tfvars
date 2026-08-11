rgs = {
  rg1 = {
    name     = "jenkins"
    location = "Central India"
  }
  rg2 = {
    name     = "docker"
    location = "Central India"
  }
}

vnet = {
  vnet1 = {
    name                = "docker-vnet"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "docker"
  }
}

snats = {
  snat1 = {
    name                 = "docker-subnet1"
    virtual_network_name = "docker-vnet"
    address_prefixes     = ["10.0.1.0/24"]
    resource_group_name  = "docker"
  }
  snat2 = {
    name                 = "docker-subnet2"
    virtual_network_name = "docker-vnet"
    address_prefixes     = ["10.0.2.0/24"]
    resource_group_name  = "docker"
  }
}

pip = {
  pip1 = {
    name                = "docker-pip"
    location            = "Central India"
    allocation_method   = "Static"
    resource_group_name = "docker"
  }
}

nic = {
  nic1 = {
    subnet_name          = "docker-subnet1"
    virtual_network_name = "docker-vnet"
    resource_group_name  = "docker"
    pip_name             = "docker-pip"
    nic-name             = "docker-nic"
    nic-location         = "Central India"

  }
}

vms = {
  vm1 = {
    nic_name             = "docker-nic"
    resource_group_name  = "docker"
    vm-name              = "docker-linux-vm"
    vm-location          = "Central India"
    vm-size              = "Standard_B2s_v2"
    admin_username       = "kapilg1996p"
    admin_password       = "kapilg1996p@123"
    publisher            = "Canonical"
    sku                  = "22_04-lts"
    version              = "latest"
    offer                = "0001-com-ubuntu-server-jammy"
    os-disk-name         = "docker-disk"
    storage_account_type = "Standard_LRS"
  }
}