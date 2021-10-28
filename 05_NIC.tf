resource "azurerm_public_ip" "pub-ip" {
  name                = "pub-ip"
  resource_group_name = azurerm_resource_group.kang_RG.name
  location            = azurerm_resource_group.kang_RG.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}#public ip create

resource "azurerm_network_interface" "kang-NI" {
  name                = "kang-nic"
  location            = azurerm_resource_group.kang_RG.location
  resource_group_name = azurerm_resource_group.kang_RG.name

  ip_configuration {
    name                          = "pub-ip"
    subnet_id                     = azurerm_subnet.kang-pub1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pub-ip.id
    #public ip push
  }
}#network interface