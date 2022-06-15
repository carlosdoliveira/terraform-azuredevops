resource "azurerm_dns_srv_record" "srv" {
  for_each = {
    for records, record in var.dns_records : records => record
    if record.type == "SRV"
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = lower(each.value.name)
  ttl  = each.value.ttl
  tags = var.tags

  dynamic "record" {
    for_each = each.value.record
    content {
      priority = split(" ", record.value)[0]
      weight   = split(" ", record.value)[1]
      port     = split(" ", record.value)[2]
      target   = split(" ", record.value)[3]
    }
  }
  depends_on = [
    azurerm_dns_zone.zone
  ]
}
