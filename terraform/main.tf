resource "azurerm_resource_group" "rg" {
  name     = "beeline-swarm-rg"
  location = "southafricanorth"
}

# swarm nfs
resource "azurerm_storage_account" "nfs-account" {
  name                     = "beelineswarmnfs"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind = "FileStorage"
}

# resource "azurerm_storage_share" "swarm-nfs-file" {
#   name                 = "beelineswarmnfsfile"
#   storage_account_name = azurerm_storage_account.nfs-account.name
#   quota = 1000
#   enabled_protocol = "NFS"
#   depends_on = [ azurerm_storage_account.nfs-account ]

# }

# vnet
resource "azurerm_virtual_network" "vnet" {
  name                = "beeline-swarm-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}


resource "azurerm_subnet" "subnet" {
  name                 = "beeline-swarm-subnet"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# NSGs
resource "azurerm_network_security_group" "nsg" {
  name                = "beeline-swarm-subnet-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# NSG rules
resource "azurerm_network_security_rule" "rules" {
  for_each               = { for rule in var.ports : rule.name => rule }
  name                   = each.value.name
  priority               = each.value.priority
  destination_port_range = each.value.dest_port
  direction              = each.value.direction
  protocol               = each.value.protocol


  access                      = "Allow"
  source_port_range           = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}


# VMs -> modules
module "vm-01" {
  source              = "./modules/vm_linux"
  vm_name             = "admin-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id
}

module "vm-02" {
  source              = "./modules/vm_linux"
  vm_name             = "manager-one-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id
}

module "vm-03" {
  source              = "./modules/vm_linux"
  vm_name             = "worker-one-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_id           = azurerm_subnet.subnet.id
}
