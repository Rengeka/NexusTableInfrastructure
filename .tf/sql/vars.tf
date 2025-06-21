variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "admin_username" {
  type    = string
  default = "admin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}