resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
  tags     = var.tags
}

module "dns" {
  source = "../../modules/dns-zone"

  resource_group_name = azurerm_resource_group.rg.name
  for_each            = var.dns_settings
  zone_name           = each.key
  dns_records         = each.value.dns_records

  depends_on = [
    azurerm_resource_group.rg
  ]
}
