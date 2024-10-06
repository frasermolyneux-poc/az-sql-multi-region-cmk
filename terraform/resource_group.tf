resource "azurerm_resource_group" "rg_neu" {
  name     = "rg-neu-${random_id.environment.hex}"
  location = "North Europe"
}

resource "azurerm_resource_group" "rg_weu" {
  name     = "rg-weu-${random_id.environment.hex}"
  location = "West Europe"
}
