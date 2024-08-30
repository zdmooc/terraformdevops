variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default     = "example-resources"
}

variable "location" {
  type        = string
  description = "The Azure location where resources will be created"
  default     = "East US"
}
