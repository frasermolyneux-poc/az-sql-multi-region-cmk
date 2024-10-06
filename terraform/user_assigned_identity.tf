resource "azurerm_user_assigned_identity" "sql_neu" {
  name = "sql-neu-${random_id.environment.hex}"

  location            = azurerm_resource_group.rg_neu.location
  resource_group_name = azurerm_resource_group.rg_neu.name
}

resource "azurerm_user_assigned_identity" "sql_weu" {
  name = "sql-weu-${random_id.environment.hex}"

  location            = azurerm_resource_group.rg_weu.location
  resource_group_name = azurerm_resource_group.rg_weu.name
}
