resource "azurerm_kubernetes_cluster" "aks" {
  name                = "example-aks1"
  location            = azurerm_resource_group.kang_RG.location
  resource_group_name = azurerm_resource_group.kang_RG.name
  dns_prefix          = "exampleaks1"

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

   network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "azure"
    
    } 
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_nod_pull" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  tags = {
    Environment = "Production"
  }
}