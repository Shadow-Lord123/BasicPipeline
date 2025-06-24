terraform {
  backend "azurerm" {
    resource_group_name  = "DevRG"
    storage_account_name = "kritagyafuncappsa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
