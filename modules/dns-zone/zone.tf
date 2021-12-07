resource "azurerm_dns_zone" "zone" {
  name                = var.zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
