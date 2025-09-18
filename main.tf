resource "azurerm_resource_group" "aks_rg1" {
  name     = var.rg1_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.rg1_name
  dns_prefix          = var.aks_cluster_name

    network_profile {
    network_plugin = "azure"
    network_policy = "calico"  # या "calico"
  }


  kubernetes_version = "1.28.2"   # example version

  default_node_pool {
    name       = "avinode"
    node_count = var.node_count
    vm_size    = var.vm_size
  }
  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

  tags = {
    Environment = "Production"
    Owner       = "Avinash"
  }
}
