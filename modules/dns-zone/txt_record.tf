resource "azurerm_dns_txt_record" "txt" {
  for_each = {
    for records, record in var.dns_records : records => record
    if lookup(record, "txt", {}) != {}
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name

  name = lower(each.value.name)
  ttl  = each.value.ttl
  tags = var.tags

  dynamic "record" {
    for_each = each.value.record
    content {
      value = record.value
    }
  }

  depends_on = [
    azurerm_dns_zone.zone
  ]
}
