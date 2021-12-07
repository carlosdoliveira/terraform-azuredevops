# Azure Vnet Module
This module presents an easy way to provision all you need for you virtual network:
 - Virtual Network
 - Subnets
 - Service Endpoints
 - Private Link Endpoint Network Policies
 - Private Link Service Network Policies
 - Subnet Delegations
 - Network Security Group Attachment
 - Route Table Attachment
 - Virtual Network Peering

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.77 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_nat_gateway_association.nat](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_nat_gateway_association) | resource |
| [azurerm_subnet_network_security_group_association.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_resource_group.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | `list(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to be imported. | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the vnet to create | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | The DNS servers to be used with vNet. Omitting or leaving this field blank will cause the resource to use Azure's Default DNS | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Valid location where subnet will be created. If this value is set as 'null' it will automatically use Resource Group's location. | `string` | `null` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | A map of subnet name to NAT Gateway ids | `map(string)` | `{}` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | A map of subnet name to Network Security Group IDs | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | A map of subnet name to Route table ids | `map(string)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | All details about the subnet that's going to be created. Must use the following inputs: <table><thead><tr><th>Name</th><th>Type</th><th>Default</th><th>Description</th><th>Required</th></tr></thead><tbody><tr><td>name</td><td>`string`</td><td>n/a</td><td>This **must be used as the key of your map**</td><td>yes</td></tr><tr><td>address\_prefix</td><td>`string`</td><td>n/a</td><td>Subnet CIDR address</td><td>yes</td></tr><tr><td>service\_endpoints</td><td>`list(string)`</td><td>`null`</td><td>Service Endpoints to be used with this subnet. Accepted values are: `Microsoft.AzureActiveDirectory`, `Microsoft.CosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage`, `Microsoft.Web`</td><td>no</td></tr><tr><td>enforce\_private\_link\_endpoint\_network\_policies</td><td>`bool`</td><td>`null`</td><td>Enable or Disable network policies for the private link endpoint on the subnet. Setting this to `true` will **Disable** the policy and setting this to `false` will **Enable** the policy. *Note*: Conflicts with `enforce_private_link_service_network_policies`.</td><td>no</td></tr><tr><td>enforce\_private\_link\_service\_network\_policies</td><td>`bool`</td><td>`null`</td><td>Enable or Disable network policies for the private link service on the subnet. Setting this to `true` will **Disable** the policy and setting this to `false` will **Enable** the policy. *Note*: Conflicts with `enforce_private_link_endpoint_network_policies`.</td><td>no</td></tr><tr><td>delegation</td><td>`map(any)`</td><td>`null`</td><td>must have the following details: <table><thead><tr><th>Name</th><th>Type</th><th>Default</th><th>Description</th><th>Required</th></tr></thead><tbody><tr><td>name</td><td>`string`</td><td>n/a</td><td>Name of your Subnet Delegation</td><td>yes</td></tr><tr><td>service\_actions</td><td>`map(any)`</td><td>n/a</td><td>Must follow the same structure as the [official documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#service_delegation) for this block attribute</td><td>yes</td></tr></tbody></table></td><td>no</td></tr></tbody></table> | `any` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(any)` | `{}` | no |
| <a name="input_vnet_peering_settings"></a> [vnet\_peering\_settings](#input\_vnet\_peering\_settings) | Map that describe all vnet peering settings. Accepts the following values: <table><thead><tr><th>Name</th><th>Type</th><th>Default</th><th>Description</th><th>Required</th></tr></thead><tbody><tr><td>name</td><td>`string`</td><td>n/a</td><td>This is the key for the map variable. You must enter a name for the vnet peering</td><td>yes</td></tr><tr><td>remote\_vnet\_id</td><td>`string`</td><td>n/a</td><td>Remote Virtual network Resource ID</td><td>yes</td></tr><tr><td>allow\_forwarded\_traffic</td><td>`bool`</td><td>`true`</td><td>This specifies if should this vnet accept forwarded traffic</td><td>no</td></tr><tr><td>allow\_gateway\_transit</td><td>`bool`</td><td>`false`</td><td>If you have a VPN Gateway or ExpressRoute Circuit you may enable this option. Otherwise, leave it as it is.</td><td>no</td></tr><tr><td>use\_remote\_gateways</td><td>`bool`</td><td>`false`</td><td>If your peer virtual network has a VPN Gateway or ExpressRoute Circuit, you may enable this option. Otherwise, leave it as it is.</td><td>no</td></tr></tbody></table> | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | The address space of the newly created vNet |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The id of the newly created vNet |
| <a name="output_vnet_location"></a> [vnet\_location](#output\_vnet\_location) | The location of the newly created vNet |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The Name of the newly created vNet |
| <a name="output_vnet_subnet_ids"></a> [vnet\_subnet\_ids](#output\_vnet\_subnet\_ids) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |

## Examples
### Basic Virtual Network Example

``` hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet-west" {
  source              = "../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
  vnet_name           = "vnet-west-europe"
  address_space       = ["10.0.0.0/16", "192.168.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.0.0.0/24"
    }
    subnet2 = {
      address_prefix = "10.0.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.168.0.0/27"
    }
  }
}
```

### Two Virtual Networks + VNet Peering Example
``` hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet-west" {
  source              = "../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westus2"
  vnet_name           = "vnet-westus2"
  address_space       = ["10.0.0.0/16", "192.168.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.0.0.0/24"
    }
    subnet2 = {
      address_prefix = "10.0.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.168.0.0/27"
    }
  }
  
  vnet_peering_settings = {
    vnet1-to-vnet2 = {
      remote_vnet_id = module.vnet-east.vnet_id
    }
    vnet2 = {
      remote_vnet_id = "/subscriptions/ff14dd7f-37f0-4ef30-b9d3-80ed9003cce5/resourceGroups/rg-minecraft/providers/Microsoft.Network/virtualNetworks/minecraft-vnet"
    }
  }

  tags = var.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "vnet-east" {
  source              = "../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_name           = "vnet-eastus2"
  address_space       = ["10.1.0.0/16", "192.169.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.1.0.0/24"
    }
    subnet2 = {
      address_prefix = "10.1.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.169.0.0/27"
    }
  }

  vnet_peering_settings = {
    "vnet2-to-vnet1" = {
      remote_vnet_id = module.vnet-west.vnet_id
    }
  }

  tags = var.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}
```

### Virtual Network with Service endpoints Example
``` hcl
resource "random_pet" "pet" {
  length    = 2
  separator = "-"
}

resource "azurerm_resource_group" "rg" {
  name     = join("-", ["rg", random_pet.pet.id])
  location = var.location
  tags     = var.tags
  depends_on = [
    random_pet.pet
  ]
}

module "vnet-east" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = var.tags
  vnet_name           = join("-", ["vnet", random_pet.pet.id])
  address_space       = ["10.1.0.0/16", "192.169.0.0/24"]

  subnets = {
    subnet1 = {
      address_prefix    = "10.1.0.0/24"
      service_endpoints = ["Microsoft.KeyVault", "Microsoft.Web"]
    }
    subnet2 = {
      address_prefix    = "10.1.1.0/24"
      service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"]
    }
    subnet3 = {
      address_prefix = "192.169.0.0/27"
    }
  }

  depends_on = [
    azurerm_resource_group.rg
  ]
}
```

### Virtual Network with Subnet Delegation Example
``` hcl
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "vnet-west" {
  source              = "../../"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westus2"
  vnet_name           = "vnet-westus2"
  address_space       = ["10.0.0.0/16", "192.168.0.0/24"]
  subnets = {
    subnet1 = {
      address_prefix = "10.0.0.0/24"
      delegation = {
        name = "delegation1"
        service_delegation = {
          name = "Microsoft.ApiManagement/service"
          actions = [
            "Microsoft.Network/networkinterfaces/*",
            "Microsoft.Network/virtualNetworks/subnets/action",
            "Microsoft.Network/virtualNetworks/subnets/join/action"
          ]
        }
      }
    }
    subnet2 = {
      address_prefix = "10.0.1.0/24"
    }
    subnet3 = {
      address_prefix = "192.168.0.0/27"
    }
  }

  tags = var.tags
  depends_on = [
    azurerm_resource_group.rg
  ]
}
```

## Deseja contribuir?

Para contruibuir com este repositório você deve instalar o [**Terraform-docs**](https://terraform-docs.io/user-guide/installation/).
Etapas:
* Clone este repositório;
* Crie uma branch;
* Realize todas as modificações que deseja;
* Faça o commit e crie uma tag (v1.1.0, v1.2.3, etc);
* Documente o código usando `make all`;
* Faça o push da sua branch seguido de um Pull Request.

<sub>Para dúvidas mande um contato: [carlos.oliveira@softwareone.com](mailto:carlos.oliveira@softwareone.com)</sub>

