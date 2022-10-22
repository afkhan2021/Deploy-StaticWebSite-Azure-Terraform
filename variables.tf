# Input variable definitions
variable "subscription_id" {
    description = "Azure Subscription ID"
    type = string
}
variable "tenant_id" {
    description = "Azure Tenant ID"
    type = string
}
variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type = string 
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type = string     
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type = string   
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type = string   
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type = string   
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type = string   
}
