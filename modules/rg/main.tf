/*
 * # Azure Resource Group Module
 * Este módulo possui o objetivo de facilitar a criação de grupos de recursos
*/

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}