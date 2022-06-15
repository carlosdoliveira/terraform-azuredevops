# Should either be a list of records or a target_resource_id (Alias)
# resource "azurerm_dns_a_record" "a" {
#   for_each = {
#     for all_records, record in var.dns_records : all_records => {
#       for a_records, a_record in record : a_records => a_record.a
#       if lookup(a_record.dns_records, "a", {}) != {}
#     }
#   }
# Should either be a list of records or a target_resource_id (Alias)
resource "azurerm_dns_a_record" "a" {
  for_each = {
    for records, record in var.dns_records : records => record
    if record.type == "A"
  }

  resource_group_name = lower(var.resource_group_name)
  zone_name           = var.zone_name
  name                = lower(each.value.name)
  ttl                 = each.value.ttl
  records             = length(lookup(each.value, "record", [])) == 0 ? null : each.value.record
  target_resource_id  = length(lookup(each.value, "record", [])) == 0 ? each.value.alias_target_resource_id : null
  tags                = var.tags

  depends_on = [
    azurerm_dns_zone.zone
  ]
}
