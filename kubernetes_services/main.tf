
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

  aad_profile {
    managed                = true
    enable_azure_rbac      = true
    admin_group_object_ids = [data.azuread_group.aks_admins.object_id]
  }

  api_server_access_profile {
    authorized_ip_ranges = ["0.0.0.0/0"]
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  oms_agent {
    log_analytics_workspace_id = data.azurerm_log_analytics_workspace.example.id
  }

  azure_policy_enabled               = true
  http_application_routing_enabled  = false
  role_based_access_control_enabled = true
  sku_tier                           = "Standard"

  tags = {
    Environment = "Production"
    Owner       = "Kritagya"
    Purpose     = "AKS Cluster"
  }
}


