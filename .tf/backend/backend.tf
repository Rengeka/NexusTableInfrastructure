resource "azurerm_container_app" "backend" {
  name                         = var.app_name
  resource_group_name          = var.resource_group_name
  #location                     = var.location
  revision_mode                = "Single"
  container_app_environment_id = var.container_app_environment_id

  template {
    
    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory
            
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    transport        = "auto"

      traffic_weight {
          latest_revision = true
          percentage = 100
      }
    }
}