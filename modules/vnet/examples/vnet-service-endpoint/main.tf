resource "random_pet" "pet" {
  length    = 2
  separator = "-"
}

resource "azurerm_resource_group" "rg" {
  name     = join("-", ["rg", random_pet.pet.id])
  location = var.location
  tags     = var.tags
  depends_on = [
    random_pet.pet
  ]
}

module "vnet-east" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags
  vnet_name           = join("-", ["vnet", random_pet.pet.id])
  address_space       = ["10.1.0.0/16", "192.169.0.0/24"]

  subnets = {
    subnet1 = {
      address_prefix    = "10.1.0.0/24"
      service_endpoints = ["Microsoft.KeyVault", "Microsoft.Web"]
    }
    subnet2 = {
      address_prefix    = "10.1.1.0/24"
      service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
    }
    subnet3 = {
      address_prefix = "192.169.0.0/27"
    }
  }

  depends_on = [
    azurerm_resource_group.rg
  ]
}
