

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account.storacc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [random_string.storacc](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_resource_group.storacc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nome do Resource Group a ser utilizado. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_location"></a> [location](#input\_location) | Região do datacenter onde o recurso será provisionado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Quais tags serão utilizados. Normalmente ele já irá puxar no momento em que o módulo for chamado. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | Primary Access Key gerada para a Storage Account |
| <a name="output_storage_account_containers"></a> [storage\_account\_containers](#output\_storage\_account\_containers) | Nome de cada um dos containers preparados para a storage account. |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | Resource ID da Storage Account. |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | Nome da Storage Account. |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | URL usada quando a feature de website é usada para Blob Storage. |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | URL primária do serviço de Blob Storage. |

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