
resource "azurerm_mssql_server" "sql_server" {
  name                         = "${var.prefix}-${var.environment}-sqlsrv"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
}

resource "azurerm_mssql_database" "sql_db" {
  name           = "${var.prefix}-${var.environment}-sql"
  server_id      = azurerm_mssql_server.sql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  sku_name       = "GP_S_Gen5_1"
  max_size_gb    = 32
  zone_redundant = false

  auto_pause_delay_in_minutes = 60
  min_capacity                 = 0.5
}