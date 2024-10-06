resource "azurerm_key_vault" "kv_neu" {
  name                = "kvvneu${random_id.environment.hex}"
  location            = azurerm_resource_group.rg_neu.location
  resource_group_name = azurerm_resource_group.rg_neu.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  soft_delete_retention_days = 90
  purge_protection_enabled   = true
  enable_rbac_authorization  = true

  sku_name = "premium"

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow"
  }
}

resource "azurerm_key_vault" "kv_weu" {
  name                = "kvvweu${random_id.environment.hex}"
  location            = azurerm_resource_group.rg_weu.location
  resource_group_name = azurerm_resource_group.rg_weu.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  soft_delete_retention_days = 90
  purge_protection_enabled   = true
  enable_rbac_authorization  = true

  sku_name = "premium"

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow"
  }
}
