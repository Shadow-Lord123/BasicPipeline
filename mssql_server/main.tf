
resource "azurerm_resource_group" "example" {
  name     = var.dev_rg_name
  location = var.location_name
}

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
    object_id      = "6fffeafb-a629-4963-9a0c-85cd6d357914"
  }

  tags = {
    environment = "production"
  }
}