#************************************
# RG Vars
#************************************
variable "rg_name" {
  type = string
}
variable "rg_location" {
  type = string
}
#************************************
# DNS Vars
#************************************
variable "dns_settings" {
  type    = any
  default = null
}
#************************************
# VNET Vars
#************************************
variable "vnet_name" {
  type = string
}
variable "vnet_address_space" {
  type = list(string)
}
variable "subnets_vnet" {
  type    = any
  default = null
}
