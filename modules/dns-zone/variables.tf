variable "resource_group_name" {
  type        = string
  description = "The name of the resource group that contains the DNS zone where the records will be added."
}

variable "zone_name" {
  type        = string
  description = "List of DNS zones to manage, in the standard terraformdns structure."
}

variable "tags" {
  type        = map(any)
  description = "List of all tags needed by this resource"
  default     = {}
}

# variable "record_sets" {
#   type = any
# }
variable "dns_records" {
  type        = any
  description = "All records must have: `ttl`, `name` and `record`."
}
