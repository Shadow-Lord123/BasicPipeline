
data "azuread_user" "sql_admin" {
  user_principal_name = "kritagyadahal345@gmail.com"
}

resource "azurerm_mssql_server" "example" {
  name                         = "kritagyasqlserver"
  resource_group_name          = var.dev_rg_name
  location                     = var.location_name
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  identity {
    type = "SystemAssigned"
  }

  azuread_administrator {
    login_username = data.azuread_user.sql_admin.user_principal_name
    object_id      = data.azuread_user.sql_admin.object_id
  }

  public_network_access_enabled       = false
  outbound_network_restriction_enabled = true
  primary_user_assigned_identity_id   = null 
  connection_policy                   = "Default"

  tags = {
    environment = "production"
    owner       = "Kritagya"
    tier        = "critical"
  }
}
