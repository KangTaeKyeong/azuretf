resource "azurerm_linux_virtual_machine_scale_set" "scaleset" {
  name                = "tf-test"
  resource_group_name = azurerm_resource_group.kang_RG.name
  location            = azurerm_resource_group.kang_RG.location
  sku                = "Standard_D2s_v3"
  admin_username      = "azureuser"
  instances           = 3

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("../../.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    /*
      Standard_LRS = HDD
      StandardSSD_LRS = SSD
      Premium_LRS = SSDv2
    */
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9"
    version   = "latest"
  }
  network_interface {
    name    = "ScaleNI"
    primary = true

    ip_configuration {
      name      = "kang-ip" 
      primary   = true # 뭐임?
      subnet_id = azurerm_subnet.kang-pri1.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend.id] #
    }
}
/*
  https://docs.microsoft.com/ko-kr/azure/virtual-machines/linux/cli-ps-findimage --> publisher, offer
  az vm image list --offer <OS name> --all --output table // CLI --> image sku search
*/
}