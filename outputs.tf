# Output variable definitions
output "storage_account_name" {
    description    =    "Name of the storage account"
    value          =    azurerm_storage_account.storage2.name
}

output "website_index-url" {
    description    =    "URL of the static website"
    value          =    azurerm_storage_account.storage2.primary_web_endpoint
}
