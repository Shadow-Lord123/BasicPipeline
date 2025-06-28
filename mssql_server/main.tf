
resource "azurerm_mssql_server" "example" {
  name                         = "kritagyasqlserver"
  resource_group_name          = var.dev_rg_name
  location                     = var.location_name
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = var.object_id
  }

  tags = {
    environment = "production"
  }
}