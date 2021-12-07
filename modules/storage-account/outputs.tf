output "storage_account_name" {
  value       = azurerm_storage_account.storacc.name
  description = "Nome da Storage Account."
}

output "storage_account_id" {
  value       = azurerm_storage_account.storacc.id
  description = "Resource ID da Storage Account."
}

output "storage_account_url" {
  value       = azurerm_storage_account.storacc.primary_blob_endpoint
  description = "URL primária do serviço de Blob Storage."
}

output "storage_access_key" {
  sensitive   = true
  value       = azurerm_storage_account.storacc.primary_access_key
  description = "Primary Access Key gerada para a Storage Account"
}

output "storage_account_primary_web_host" {
  value       = azurerm_storage_account.storacc.primary_web_host
  description = "URL usada quando a feature de website é usada para Blob Storage."
}

output "storage_account_containers" {
  value       = [for container in azurerm_storage_container.container : container.name]
  description = "Nome de cada um dos containers preparados para a storage account."
}
