# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0" 
    }            
  }
}

# Provider Block
provider "azurerm" {
    subscription_id =   var.subscription_id
    tenant_id       =   var.tenant_id
    features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
    name                  =   var.resource_group_name
    location              =   var.location
}

# - Create a Storage account with Network Rules
resource "azurerm_storage_account" "storage2" {
    name                          =    var.storage_account_name
    resource_group_name           =    azurerm_resource_group.rg.name
    location                      =    azurerm_resource_group.rg.location
    account_kind                  =    var.storage_account_kind
    account_tier                  =    var.storage_account_tier
    account_replication_type      =    var.storage_account_replication_type

    static_website {
        index_document              = "index.html"
        error_404_document          = "404.html"
    }
}

resource "azurerm_storage_blob" "static_files_index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage2.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 ="./index.html"

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_storage_account.storage2
  ]
}

resource "azurerm_storage_blob" "static_files_error_html" {
  name                   = "error.html"
  storage_account_name   = azurerm_storage_account.storage2.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 ="./error.html"

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_storage_account.storage2
  ]
}