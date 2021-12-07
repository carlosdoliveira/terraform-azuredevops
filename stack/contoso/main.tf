module "rg" {
  source = "../../modules/rg"

  rg_name  = var.rg_name
  location = var.rg_location
}
module "dns" {
  source = "../../modules/dns-zone"

  resource_group_name = module.rg.name
  for_each            = var.dns_settings
  zone_name           = each.key
  dns_records         = each.value.dns_records

  depends_on = [
    module.rg
  ]
}
module "vnet" {
  source = "../../modules/vnet"

  resource_group_name = module.rg.name
  location            = module.rg.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
  subnets             = var.subnets_vnet

  depends_on = [
    module.rg
  ]
}
