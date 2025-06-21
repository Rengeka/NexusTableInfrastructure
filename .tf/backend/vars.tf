variable "app_name" {
  description = "Name of the Azure Container App"
  type        = string
  default     = "nexus-table-backend-container-app"
}

variable "resource_group_name" {
  description = "Name of the Resource Group where the Container App will be created"
  type        = string
}

variable "location" {
  description = "Azure region to deploy the resource"
  type        = string
  default     = "northeurope" 
}

variable "container_name" {
  description = "Name of the container inside the Container App"
  type        = string
  default     = "mycontainer"
}

variable "container_image" {
  description = "Docker image of the container (e.g. nginx:latest)"
  type        = string
  default     = "nginx:latest"
}

variable "cpu" {
  description = "Number of vCPU allocated to the container"
  type        = number
  default     = 0.5
}

variable "memory" {
  description = "Amount of memory allocated to the container (e.g. 1.0Gi)"
  type        = string
  default     = "1.0Gi"
}

variable "container_app_environment_id" {
  type        = string
}