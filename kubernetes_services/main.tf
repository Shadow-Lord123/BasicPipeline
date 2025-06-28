
resource "azurerm_kubernetes_cluster" "example" {
  name                = "kritagyaaks1"
  location            = var.location_name
  resource_group_name = var.dev_rg_name
  dns_prefix          = "kritagyadns"
  node_resource_group = "DefaultRG"

  kubernetes_version = "1.29.2"

  default_node_pool {
    name                = "default"
    node_count          = 2
    vm_size             = "Standard_D4s_v3"
    enable_auto_scaling = true
    min_count           = 2
    max_count           = 5
    os_disk_size_gb     = 100
    type                = "VirtualMachineScaleSets"
    mode                = "System"
    node_labels = {
      environment = "production"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true
  azure_policy_enabled              = true

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
  }

  auto_upgrade_profile {
    upgrade_channel = "stable"
  }

  diagnostics_profile {
    enabled = true
  }

  sku_tier = "Standard"

  tags = {
    Environment = "Production"
    Owner       = "Kritagya"
    Purpose     = "Minimal AKS Cluster"
  }
}

