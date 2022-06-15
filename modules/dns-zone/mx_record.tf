resource "azurerm_dns_mx_record" "mx" {
  for_each = {
    for records, record in var.dns_records : records => record
    if record.type == "MX"
  }

  resource_group_name = lower(lower(var.resource_group_name))
  zone_name           = var.zone_name
  name                = lower(each.value.name)
  ttl                 = each.value.ttl
  tags                = var.tags

  dynamic "record" {
    for_each = each.value.record
    content {
      preference = split(" ", record.value)[0]
      exchange   = split(" ", record.value)[1]
    }
  }

  depends_on = [
    azurerm_dns_zone.zone
  ]
}
