
resource "azurerm_container_app" "frontend" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  #location            = var.location
  revision_mode = "Single"
  container_app_environment_id = "eadas"

  template {  
    container {
        name   = var.container_name
        image  = var.container_image
        cpu    = var.cpu
        memory = var.memory
    }
  }
}
