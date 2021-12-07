resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet-west" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westus2"
  vnet_name           = "vnet-westus2"
  address_space       = ["10.0.0.0/16", "192.168.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.0.0.0/24"
      delegation = {
        name = "delegation1"
        service_delegation = {
          name = "Microsoft.ApiManagement/service"
          actions = [
            "Microsoft.Network/networkinterfaces/*",
            "Microsoft.Network/virtualNetworks/subnets/action",
            "Microsoft.Network/virtualNetworks/subnets/join/action"
          ]
        }
      }
    }
    subnet2 = {
      address_prefix = "10.0.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.168.0.0/27"
    }
  }

  tags = var.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}
