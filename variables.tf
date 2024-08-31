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
  default     = "275fdc36-9fe1-4073-accb-84313298d014"
}

variable "client_id" {
  description = "Azure AD client ID"
  default     = "1525d4c1-cf10-4589-a860-e1ef47af8a04"
}

variable "subscription_id" {
  description = "Subscription ID"
  default     = "4caaba69-1958-4137-a50b-e34af1a08823"
}
