resource "random_id" "username_suffix" {
  byte_length = 4
}

resource "random_password" "sql_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_mssql_server" "sql_server_neu" {
  name = "sql-neu-${random_id.environment.hex}"

  resource_group_name = azurerm_resource_group.rg_neu.name
  location            = azurerm_resource_group.rg_neu.location

  version = "12.0"

  administrator_login          = "addy${random_id.username_suffix.hex}"
  administrator_login_password = random_password.sql_admin_password.result

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.sql-neu.name
    object_id      = azurerm_user_assigned_identity.sql-neu.principal_id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.sql-neu.id
    ]
  }

  primary_user_assigned_identity_id = azurerm_user_assigned_identity.sql-neu.id
  // Where is the auto rotation property for this? *sigh* - https://github.com/hashicorp/terraform-provider-azurerm/issues/23667
  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.sql_key.id

  depends_on = [
    azurerm_role_assignment.neu_sql_to_neu_kv
  ]
}

resource "azurerm_mssql_server" "sql_server_weu" {
  name = "sql-weu-${random_id.environment.hex}"

  resource_group_name = azurerm_resource_group.rg_weu.name
  location            = azurerm_resource_group.rg_weu.location

  version = "12.0"

  administrator_login          = "addy${random_id.username_suffix.hex}"
  administrator_login_password = random_password.sql_admin_password.result

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.sql-weu.name
    object_id      = azurerm_user_assigned_identity.sql-weu.principal_id
  }

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.sql-weu.id
    ]
  }

  primary_user_assigned_identity_id            = azurerm_user_assigned_identity.sql-weu.id
  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.sql_key.id

  depends_on = [
    azurerm_role_assignment.weu_sql_to_neu_kv
  ]
}
