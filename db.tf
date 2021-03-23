locals {
  db_admin_user = "evenh"
}

resource "random_password" "admin_password" {
  length  = 64
  special = true
  lower   = true
  upper   = true
}

resource "azurerm_mysql_server" "default" {
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  name                = "rip-${var.application_name}"

  administrator_login          = local.db_admin_user
  administrator_login_password = random_password.admin_password.result

  sku_name                          = "B_Gen5_1"
  storage_mb                        = 5120
  version                           = "5.7"
  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"

  tags = local.defaultTags
}

resource "azurerm_mysql_database" "default" {
  resource_group_name = azurerm_resource_group.default.name
  server_name         = azurerm_mysql_server.default.name
  name                = "app"
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "default" {
  name                = "${azurerm_resource_group.default.name}-azure-access"
  resource_group_name = azurerm_resource_group.default.name
  server_name         = azurerm_mysql_server.default.name
  start_ip_address    = "0.0.0.0" // Magic value for Azure access
  end_ip_address      = "0.0.0.0"
}
