output "vnet_name" {
  value = module.vnet.vnet_name
}

output "subnet_name" {
  value = module.vnet.vnet_subnet_names
}

output "dns_records" {
  value = {
    for k in module.dns : k.zone_name => k
  }
}
