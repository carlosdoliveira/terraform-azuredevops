

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service) | resource |
| [azurerm_app_service_certificate.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_certificate) | resource |
| [azurerm_app_service_custom_hostname_binding.cust-host-bind](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_custom_hostname_binding) | resource |
| [azurerm_app_service_plan.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_plan) | resource |
| [azurerm_app_service_virtual_network_swift_connection.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_application_insights.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_dns_a_record.a](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_a_record) | resource |
| [azurerm_dns_aaaa_record.aaaa](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_aaaa_record) | resource |
| [azurerm_dns_cname_record.cname](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_cname_record) | resource |
| [azurerm_dns_mx_record.mx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_mx_record) | resource |
| [azurerm_dns_ns_record.ns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_ns_record) | resource |
| [azurerm_dns_srv_record.srv](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_srv_record) | resource |
| [azurerm_dns_txt_record.txt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_txt_record) | resource |
| [azurerm_dns_zone.zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/dns_zone) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_container.storcont](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [time_rotating.main](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/rotating) | resource |
| [azurerm_application_insights.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/application_insights) | data source |
| [azurerm_client_config.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.storeacc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_account_blob_container_sas.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account_blob_container_sas) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_records"></a> [dns\_records](#input\_dns\_records) | All records must have: `ttl`, `name` and `record`. | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group that contains the DNS zone where the records will be added. | `string` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | List of DNS zones to manage, in the standard terraformdns structure. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of all tags needed by this resource | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_aaaa_records"></a> [aaaa\_records](#output\_aaaa\_records) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_mx_records"></a> [mx\_records](#output\_mx\_records) | n/a |
| <a name="output_ns_records"></a> [ns\_records](#output\_ns\_records) | n/a |
| <a name="output_srv_records"></a> [srv\_records](#output\_srv\_records) | n/a |
| <a name="output_txt_records"></a> [txt\_records](#output\_txt\_records) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | DNS Zone Resource ID |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | DNS Zone name |

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

