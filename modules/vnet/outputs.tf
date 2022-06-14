output "vnet_id" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_location" {
  description = "The location of the newly created vNet"
  value       = azurerm_virtual_network.vnet.location
}

output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = azurerm_virtual_network.vnet.address_space
}

output "vnet_subnet_names" {
  description = "The name of each created subnet."
  value = tomap(
    {
      for name, subnet in azurerm_subnet.subnet : name => subnet.name
    }
  )
}

output "vnet_subnet_ids" {
  description = "The Resource Id of each subnet."
  value = tomap(
    {
      for id, subnet in azurerm_subnet.subnet : id => subnet.id
    }
  )
}