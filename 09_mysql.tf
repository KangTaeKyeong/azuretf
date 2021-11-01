# resource "azurerm_mysql_server" "kang-db-server" {
#   name                = "kang-db"
#   location            = azurerm_resource_group.kang_RG.location
#   resource_group_name = azurerm_resource_group.kang_RG.name

#   administrator_login          = "root1"
#   administrator_login_password = "it123412341!"

#   sku_name   = "B_Gen5_2"
#   storage_mb = 5120
#   version    = "5.7"

#   backup_retention_days             = 7
#   auto_grow_enabled                 = false
#   geo_redundant_backup_enabled      = false
#   infrastructure_encryption_enabled = false
#   public_network_access_enabled     = true
#   ssl_enforcement_enabled           = false
#   ssl_minimal_tls_version_enforced  = "TLSEnforcementDisabled"
# }

# resource "azurerm_mysql_database" "kang-db" {
#   name                = "db"
#   resource_group_name = azurerm_resource_group.kang_RG.name
#   server_name         = azurerm_mysql_server.kang-db-server.name
#   charset             = "utf8"
#   collation           = "utf8_unicode_ci"
# }

# resource "azurerm_mysql_firewall_rule" "kang-db-fw" {
#   name                = "test-fw"
#   resource_group_name = azurerm_resource_group.kang_RG.name
#   server_name         = azurerm_mysql_server.kang-db-server.name
#   start_ip_address    = "0.0.0.0"
#   end_ip_address      = "255.255.255.255"
# }