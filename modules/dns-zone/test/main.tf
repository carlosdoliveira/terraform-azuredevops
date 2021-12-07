resource "azurerm_resource_group" "rg" {
  name     = "test-rg"
  location = "eastus2"
}

module "dns" {
  source              = "../"
  for_each            = var.dns_settings
  resource_group_name = azurerm_resource_group.rg.name
  zone_name           = each.key
  dns_records         = lookup(each.value, "dns_records", {})
}

variable "dns_settings" {
  type = any
  default = {
    "cloudsquad.com.br" = {
      dns_records = {
        a = {
          "@" = {
            ttl     = 300
            records = ["192.168.0.2", "192.168.0.1"]
          }
          "www" = {
            ttl     = 300
            records = ["10.0.0.1"]
          }
        }
      }
    }
  }
}
