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
