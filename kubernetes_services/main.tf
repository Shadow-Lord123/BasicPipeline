
resource "azurerm_kubernetes_cluster" "example" {
  name                = "kritagyaaks1"
  location            = var.location_name
  resource_group_name = var.dev_rg_name       
  dns_prefix          = "kritagyadns"
  
  node_resource_group = "DefaultRG"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
