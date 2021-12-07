output "name" {
  description = "Gives the created rg name to be used on another resource"
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}