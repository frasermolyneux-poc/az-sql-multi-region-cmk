resource "azurerm_mssql_database" "sql_db_neu" {
  name      = "sql-db-${random_id.environment.hex}"
  server_id = azurerm_mssql_server.sql_server_neu.id

  sku_name = "S0"
}
