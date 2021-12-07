variable "storage_account_name" {
  type        = string
  description = "Nome da Storage Account."
}

variable "location" {
  type        = string
  default     = null
  description = "Região do datacenter onde o recurso será provisionado."
}

variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group a ser utilizado."
}

variable "tier" {
  type        = string
  default     = "Standard"
  description = "Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`."
}

variable "kind" {
  type        = string
  default     = "StorageV2"
  description = "Qual SKU do do blob storage é usado."
}

variable "replication" {
  type        = string
  default     = "GRS"
  description = "Que tipo de replicação será usada pela Storage Account."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Quais tags serão utilizados. Normalmente ele já irá puxar no momento em que o módulo for chamado."
}

variable "static_website_enabled" {
  type        = bool
  default     = false
  description = "Especifica se o armazenamento para websites estáticos será habilitado."
}

variable "static_website" {
  type        = map(any)
  default     = {}
  description = "Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código)."
}
variable "storacc_containers" {
  type        = map(any)
  default     = {}
  description = "Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. \nNo bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`."
}

variable "enable_secure_transfer" {
  type        = bool
  default     = true
  description = "Força ou não a utilização de transferência de dados exclusivamente por HTTPS."
}
