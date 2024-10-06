resource "azurerm_mssql_failover_group" "failover" {
  name      = "sql-db-fo-${random_id.environment.hex}"
  server_id = azurerm_mssql_server.sql_server_neu.id

  databases = [
    azurerm_mssql_database.sql_db_neu.id
  ]

  partner_server {
    id = azurerm_mssql_server.sql_server_weu.id
  }

  read_write_endpoint_failover_policy {
    mode          = "Automatic"
    grace_minutes = 60
  }

  tags = var.tags
}
