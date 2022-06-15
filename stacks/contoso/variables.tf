#------------------------------------
# RG Vars
#------------------------------------
variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

variable "tags" {
  type    = map(any)
  default = {}
}

#------------------------------------
# DNS Vars
#------------------------------------
variable "dns_settings" {
  type    = any
  default = null
}
