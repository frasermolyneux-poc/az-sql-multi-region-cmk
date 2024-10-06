resource "azurerm_role_assignment" "neu_sql_to_neu_kv" {
  scope                = azurerm_key_vault.kv_neu.id
  role_definition_name = "Key Vault Crypto Service Encryption User"
  principal_id         = azurerm_user_assigned_identity.sql_neu.principal_id
}

resource "azurerm_role_assignment" "neu_sql_to_weu_kv" {
  scope                = azurerm_key_vault.kv_weu.id
  role_definition_name = "Key Vault Crypto Service Encryption User"
  principal_id         = azurerm_user_assigned_identity.sql_neu.principal_id
}

resource "azurerm_role_assignment" "weu_sql_to_weu_kv" {
  scope                = azurerm_key_vault.kv_weu.id
  role_definition_name = "Key Vault Crypto Service Encryption User"
  principal_id         = azurerm_user_assigned_identity.sql_weu.principal_id
}

resource "azurerm_role_assignment" "weu_sql_to_neu_kv" {
  scope                = azurerm_key_vault.kv_neu.id
  role_definition_name = "Key Vault Crypto Service Encryption User"
  principal_id         = azurerm_user_assigned_identity.sql_weu.principal_id
}
