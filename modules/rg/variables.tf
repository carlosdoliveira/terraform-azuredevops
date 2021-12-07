variable "rg_name" {
  description = "Dar nome ao resource group"
  type = string
}

variable "location" {
  description = "Fornecer a localização de onde o resource group deverá ser criado"
  type    = string
  default = "westeurope"
}

variable "tags" {
  description = "Descrever quais tags deverão ser incluídas no resource group"
  type    = any
  default = null
}