resource "azurerm_resource_group" "nexus_table_rg" {
  name     = "${var.prefix}-${var.environment}-rg"
  location = var.location  
}

# module "sql" {
#   source              = "./sql"
#   resource_group_name = azurerm_resource_group.nexus_table_rg.name
#   location            = var.location    
#   prefix              = var.prefix
#   environment         = var.environment
#   admin_username      = local.SQL_ADMIN_USER
#   admin_password      = var.sql_admin_password
# }

resource "azurerm_container_app_environment" "nexus-table-container-app-env" {
  name                = "${var.prefix}-${var.environment}-container-env"
  location            = var.location     
  resource_group_name = azurerm_resource_group.nexus_table_rg.name
}

module "backend" {
  source                     = "./backend"
  resource_group_name        = azurerm_resource_group.nexus_table_rg.name
  location                   = var.location   
  app_name                   = "${var.prefix}-${var.environment}-app"
  container_name             = "backend"
  container_image            = "rengeka/nexus-table-backend:latest"
  cpu                        = 0.5
  memory                     = "1.0Gi"
  container_app_environment_id = azurerm_container_app_environment.nexus-table-container-app-env.id
}

# module "frontend" {
#   source              = "./modules/frontend"
#   prefix              = var.prefix
#   environment         = var.environment
#   resource_group_name = azurerm_resource_group.nexus_table_rg.name
#   location            = var.location

#   app_name            = "${var.prefix}-${var.environment}-app"
#   container_name      = "frotnend"
#   container_image     = "rengeka/nexus-table-frontend:latest"
#   cpu                 = 0.5
#   memory              = "1.0Gi"
# }