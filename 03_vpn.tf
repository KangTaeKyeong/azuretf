# resource "azurerm_virtual_network" "kang-vpn" {
#   name                = "kang-network"
#   resource_group_name = azurerm_resource_group.kang_RG.name
#   location            = azurerm_resource_group.kang_RG.location
#   address_space       = ["10.0.0.0/16"]
# }#setting vpn