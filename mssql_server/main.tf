
resource "azurerm_mssql_server" "example" {
  name                         = "kritagyasqlserver"
  resource_group_name          = "dev-resource-group"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "thisIsKat11"
  minimum_tls_version          = "1.2"

  public_network_access_enabled        = true
  outbound_network_restriction_enabled = true

  identity {
    type = "SystemAssigned"
  }

  azuread_administrator {
    login_username = "AzureAD Admin"
    object_id      = "11111111-1111-1111-1111-111111111111"
  }

  tags = {
    env   = "prod"
    team  = "devops"
    proj  = "sql"
    tf    = "true"
    comp  = "yes"
    crit  = "yes"
    patch = "yes"
    upd   = "2025-06-30"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_mssql_firewall_rule" "allow_my_ip" {
  name              = "allow-my-ip"
  server_id         = azurerm_mssql_server.example.id
  start_ip_address  = "86.24.253.5"  # <--- Replace with your IP
  end_ip_address    = "86.24.253.5"
}

resource "azurerm_mssql_firewall_rule" "allow_azure" {
  name              = "allow-azure-services"
  server_id         = azurerm_mssql_server.example.id
  start_ip_address  = "0.0.0.0"
  end_ip_address    = "0.0.0.0"
}
