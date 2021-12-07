
variable "tags" {
  type    = map(any)
  default = {
    environment = "test"
    managedBy = "terraform"
  }
}