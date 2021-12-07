# Azure Resource Group Module
Este módulo possui o objetivo de facilitar a criação de grupos de recursos

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Dar nome ao resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Descrever quais tags deverão ser incluídas no resource group | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Fornecer a localização de onde o resource group deverá ser criado | `string` | `"westeurope"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_location"></a> [location](#output\_location) | n/a |
| <a name="output_name"></a> [name](#output\_name) | Gives the created rg name to be used on another resource |

## Examples
### Basic Resource Group with Tags Example

``` hcl
module "<the-name-you-want-Ex-rg-dev>"{
    source              = "../"
    rg_name = "dev-app-gybr"
    tags = {
    "key" = "value"
  } 
    
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

