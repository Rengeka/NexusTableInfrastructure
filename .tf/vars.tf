variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
}

variable "environment" {
  description = "Deployment environment (dev, prod)"
  type        = string
  default     = "dev"
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = null
}

variable "prefix" {
  description = "Resource name prefix"
  type        = string
  default     = "nexus-table"
}

variable "sql_admin_password" {
  description = "SQL administrator password"
  type        = string
  sensitive   = true
}