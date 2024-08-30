# variables.tf
variable "location" {
  description = "The location where resources will be deployed."
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "azdevops-resources"
}

variable "tenant_id" {
  description = "Azure AD tenant ID"
}

variable "client_id" {
  description = "Azure AD client ID"
}

