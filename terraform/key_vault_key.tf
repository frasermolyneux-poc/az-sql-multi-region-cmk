resource "azurerm_key_vault_key" "sql_key" {
  name         = "sql-key"
  key_vault_id = azurerm_key_vault.kv_neu.id
  key_type     = "RSA-HSM"
  key_size     = 2048

  key_opts = ["unwrapKey", "wrapKey"]
}
