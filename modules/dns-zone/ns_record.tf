resource "azurerm_dns_ns_record" "ns" {
  for_each = {
    for records, record in var.dns_records : records => record
    if lookup(record, "ns", {}) != {}
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name
  name                = lower(each.value.name)
  ttl                 = each.value.ttl
  records             = each.value.record
  tags                = var.tags

  depends_on = [
    azurerm_dns_zone.zone
  ]
}
