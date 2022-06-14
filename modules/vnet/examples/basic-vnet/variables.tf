variable "resource_group_name" {
  type    = string
  default = "rg-testing"
}


variable "location" {
  type    = string
  default = "eastus2"
}

variable "tags" {
  type = map(any)
  default = {
    environment = "test"
    managedBy   = "terraform"
  }
}
