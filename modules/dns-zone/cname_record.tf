locals {
  shutter_domain = "azureedge.net"
}

resource "azurerm_dns_cname_record" "cname" {
  for_each = {
    for records, record in var.dns_records : records => record
    if lookup(record, "cname", {}) != {}
  }


  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name
  name                = lower(each.value.name)
  ttl                 = each.value.ttl
  record              = each.value.record
  tags                = var.tags

  depends_on = [
    azurerm_dns_zone.zone
  ]
}
