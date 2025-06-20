variable "rg_name" {
  description = "Resource Group for VPC"
  type        = string
}

variable "location_name" {
  description = "Location Name for VPC"
  type        = string
}

variable "Client_ID" {
  description = "Azure Client ID"
  type        = string
}

variable "Client_Secret" {
  description = "Azure Client Secret"
  type        = string
  sensitive   = true
}

variable "Subscription_ID" {
  description = "Azure Subscription ID"
  type        = string
}

variable "Tenant_ID" {
  description = "Azure Tenant ID"
  type        = string
}
