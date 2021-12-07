resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet-west" {
  source              = "../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westus2"
  vnet_name           = "vnet-westus2"
  address_space       = ["10.0.0.0/16", "192.168.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.0.0.0/24"
    }
    subnet2 = {
      address_prefix = "10.0.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.168.0.0/27"
    }
  }

  vnet_peering_settings = {
    vnet1-to-vnet2 = {
      remote_vnet_id = module.vnet-east.vnet_id
    }
    vnet2 = {
      remote_vnet_id = "/subscriptions/ff14dd7f-37f0-4ef30-b9d3-80ed9003cce5/resourceGroups/rg-minecraft/providers/Microsoft.Network/virtualNetworks/minecraft-vnet"
    }
  }

  tags = var.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "vnet-east" {
  source              = "../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "vnet-eastus2"
  address_space       = ["10.1.0.0/16", "192.169.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.1.0.0/24"
    }
    subnet2 = {
      address_prefix = "10.1.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.169.0.0/27"
    }
  }

  vnet_peering_settings = {
    "vnet2-to-vnet1" = {
      remote_vnet_id = module.vnet-west.vnet_id
    }
  }

  tags = var.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}
