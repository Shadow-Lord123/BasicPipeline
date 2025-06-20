
resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.location_name
}

resource "azurerm_storage_account" "example" {
  name                     = "functionsapptestsa"
  resource_group_name      = var.rg_name
  location                 = var.location_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "azure-functions-test-service-plan"
  location            = var.location_name
  resource_group_name = var.rg_name

  sku_name = "S1"
  os_type  = "Windows"
}

resource "azurerm_function_app" "example" {
  name                       = "test-azure-functions"
  location                   = var.location_name
  resource_group_name        = var.rg_name
  app_service_plan_id        = azurerm_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}