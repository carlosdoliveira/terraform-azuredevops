# output "name_servers" {
#   value = azurerm_dns_zone.dns_zone.*.name_servers
# }

# output "private_dns_zone_name" {
#   value = azurerm_private_dns_zone.private_dns_zone.0.name

#   depends_on = [azurerm_private_dns_zone.private_dns_zone]
# }

#output "private_name_servers" {
#  value = azurerm_private_dns_zone.private_dns_zone.0.name_servers

#  depends_on = [azurerm_private_dns_zone.private_dns_zone]
#}
output "zone_name" {
  value       = azurerm_dns_zone.zone.name
  description = "DNS Zone name"
}

output "zone_id" {
  value       = azurerm_dns_zone.zone.id
  description = "DNS Zone Resource ID"
}

output "a_records" {
  value = { for k, v in azurerm_dns_a_record.a : k => v.records }
}

output "aaaa_records" {
  value = { for k, v in azurerm_dns_aaaa_record.aaaa : k => v.records }
}

output "cname_records" {
  value = { for k, v in azurerm_dns_cname_record.cname : k => v.record }
}

output "mx_records" {
  value = { for k, v in azurerm_dns_mx_record.mx : k => v.record }
}

output "ns_records" {
  value = { for k, v in azurerm_dns_ns_record.ns : k => v.records }
}

output "srv_records" {
  value = { for k, v in azurerm_dns_srv_record.srv : k => v.record }
}

output "txt_records" {
  value = { for k, v in azurerm_dns_txt_record.txt : k => v.record }
}
