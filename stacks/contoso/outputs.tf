output "dns_records" {
  value = {
    for k in module.dns : k.zone_name => k
  }
}
