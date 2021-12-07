variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  type        = string
  description = "Valid location where subnet will be created. If this value is set as 'null' it will automatically use Resource Group's location."
  default     = null
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used by the virtual network."
}
# If no values specified, this defaults to Azure DNS
variable "dns_servers" {
  description = "The DNS servers to be used with vNet. Omitting or leaving this field blank will cause the resource to use Azure's Default DNS"
  type        = list(string)
  default     = []
}

variable "subnet_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = map(any)
  default     = {}
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "A map of subnet name to enable/disable private link endpoint network policies on the subnet."
  type        = map(bool)
  default     = {}
}

variable "subnet_enforce_private_link_service_network_policies" {
  description = "A map of subnet name to enable/disable private link service network policies on the subnet."
  type        = map(bool)
  default     = {}
}

variable "nsg_ids" {
  description = "A map of subnet name to Network Security Group IDs"
  type        = map(string)
  default     = {}
}

variable "route_tables_ids" {
  description = "A map of subnet name to Route table ids"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_ids" {
  description = "A map of subnet name to NAT Gateway ids"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(any)
  default     = {}
}

#------------------------
# Subnet Variables
#------------------------

variable "subnets" {
  type        = any
  description = "All details about the subnet that's going to be created. Must use the following inputs: <table><thead><tr><th>Name</th><th>Type</th><th>Default</th><th>Description</th><th>Required</th></tr></thead><tbody><tr><td>name</td><td>`string`</td><td>n/a</td><td>This **must be used as the key of your map**</td><td>yes</td></tr><tr><td>address_prefix</td><td>`string`</td><td>n/a</td><td>Subnet CIDR address</td><td>yes</td></tr><tr><td>service_endpoints</td><td>`list(string)`</td><td>`null`</td><td>Service Endpoints to be used with this subnet. Accepted values are: `Microsoft.AzureActiveDirectory`, `Microsoft.CosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage`, `Microsoft.Web`</td><td>no</td></tr><tr><td>enforce_private_link_endpoint_network_policies</td><td>`bool`</td><td>`null`</td><td>Enable or Disable network policies for the private link endpoint on the subnet. Setting this to `true` will **Disable** the policy and setting this to `false` will **Enable** the policy. *Note*: Conflicts with `enforce_private_link_service_network_policies`.</td><td>no</td></tr><tr><td>enforce_private_link_service_network_policies</td><td>`bool`</td><td>`null`</td><td>Enable or Disable network policies for the private link service on the subnet. Setting this to `true` will **Disable** the policy and setting this to `false` will **Enable** the policy. *Note*: Conflicts with `enforce_private_link_endpoint_network_policies`.</td><td>no</td></tr><tr><td>delegation</td><td>`map(any)`</td><td>`null`</td><td>must have the following details: <table><thead><tr><th>Name</th><th>Type</th><th>Default</th><th>Description</th><th>Required</th></tr></thead><tbody><tr><td>name</td><td>`string`</td><td>n/a</td><td>Name of your Subnet Delegation</td><td>yes</td></tr><tr><td>service_actions</td><td>`map(any)`</td><td>n/a</td><td>Must follow the same structure as the [official documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#service_delegation) for this block attribute</td><td>yes</td></tr></tbody></table></td><td>no</td></tr></tbody></table>"
  default     = {}
}

#-----------------------
# Peering variables
#-----------------------

variable "vnet_peering_settings" {
  type        = any
  description = "Map that describe all vnet peering settings. Accepts the following values: <table><thead><tr><th>Name</th><th>Type</th><th>Default</th><th>Description</th><th>Required</th></tr></thead><tbody><tr><td>name</td><td>`string`</td><td>n/a</td><td>This is the key for the map variable. You must enter a name for the vnet peering</td><td>yes</td></tr><tr><td>remote_vnet_id</td><td>`string`</td><td>n/a</td><td>Remote Virtual network Resource ID</td><td>yes</td></tr><tr><td>allow_forwarded_traffic</td><td>`bool`</td><td>`true`</td><td>This specifies if should this vnet accept forwarded traffic</td><td>no</td></tr><tr><td>allow_gateway_transit</td><td>`bool`</td><td>`false`</td><td>If you have a VPN Gateway or ExpressRoute Circuit you may enable this option. Otherwise, leave it as it is.</td><td>no</td></tr><tr><td>use_remote_gateways</td><td>`bool`</td><td>`false`</td><td>If your peer virtual network has a VPN Gateway or ExpressRoute Circuit, you may enable this option. Otherwise, leave it as it is.</td><td>no</td></tr></tbody></table>"
  default     = null
}
