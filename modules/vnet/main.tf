/*
 * # Azure Vnet Module
 * This module presents an easy way to provision all you need for you virtual network: 
 *  - Virtual Network
 *  - Subnets
 *  - Service Endpoints
 *  - Private Link Endpoint Network Policies
 *  - Private Link Service Network Policies
 *  - Subnet Delegations
 *  - Network Security Group Attachment
 *  - Route Table Attachment
 *  - Virtual Network Peering
*/

data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.vnet.name
  location            = var.location == null ? data.azurerm_resource_group.vnet.location : var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
  depends_on          = [data.azurerm_resource_group.vnet]
}

resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = each.key
  resource_group_name                            = data.azurerm_resource_group.vnet.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = [each.value.address_prefix]
  service_endpoints                              = lookup(each.value, "service_endpoints", [])
  enforce_private_link_endpoint_network_policies = lookup(each.value, "enforce_private_link_endpoint_network_policies", null)
  enforce_private_link_service_network_policies  = lookup(each.value, "enforce_private_link_service_network_policies", null)
  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", {}) != {} ? [1] : []
    content {
      name = lookup(each.value.delegation, "name", null)
      service_delegation {
        name    = lookup(each.value.delegation.service_delegation, "name", null)
        actions = lookup(each.value.delegation.service_delegation, "actions", null)
      }
    }
  }
}

locals {
  azurerm_subnets = {
    for index, subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  for_each                  = var.nsg_ids
  subnet_id                 = local.azurerm_subnets[each.key]
  network_security_group_id = each.value
}

resource "azurerm_subnet_route_table_association" "vnet" {
  for_each       = var.route_tables_ids
  route_table_id = each.value
  subnet_id      = local.azurerm_subnets[each.key]
}

resource "azurerm_subnet_nat_gateway_association" "nat" {
  for_each       = var.nat_gateway_ids
  subnet_id      = local.azurerm_subnets[each.key]
  nat_gateway_id = each.value
}

resource "azurerm_virtual_network_peering" "vnet" {
  for_each = var.vnet_peering_settings == null ? {} : var.vnet_peering_settings

  resource_group_name          = var.resource_group_name
  remote_virtual_network_id    = each.value.remote_vnet_id
  virtual_network_name         = azurerm_virtual_network.vnet.name
  name                         = each.key
  allow_forwarded_traffic      = lookup(each.value, "allow_forwarded_traffic", true)
  allow_virtual_network_access = lookup(each.value, "allow_virtual_network_access", true)
  allow_gateway_transit        = lookup(each.value, "allow_gateway_transit", false)
  use_remote_gateways          = lookup(each.value, "use_remote_gateways", false)

  depends_on = [
    azurerm_virtual_network.vnet,
    data.azurerm_resource_group.vnet
  ]
}
