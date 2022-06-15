resource "azurerm_dns_aaaa_record" "aaaa" {
  for_each = {
    for records, record in var.dns_records : records => record
    if record.type == "AAAA"
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name
  ttl                 = each.value.ttl
  name                = lower(each.value.name)
  records             = length(lookup(each.value, "record", [])) == 0 ? null : each.value.record
  target_resource_id  = length(lookup(each.value, "record", [])) == 0 ? each.value.alias_target_resource_id : null
  tags                = var.tags

  depends_on = [
    azurerm_dns_zone.zone
  ]
}
