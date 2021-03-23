resource "random_string" "app_id" {
  length  = 12
  lower   = true
  upper   = false
  special = false
}

resource "azurerm_container_group" "app" {
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  name                = var.application_name
  ip_address_type     = "public"
  dns_name_label      = "rip-${random_string.app_id.result}"
  os_type             = "Linux"

  container {
    name   = var.application_name
    image  = var.application_image
    cpu    = "1"
    memory = "1"

    ports {
      port     = var.application_port
      protocol = "TCP"
    }

    environment_variables = {
      // Egne tilpasninger
      "SERVER_PORT" = var.application_port
      // Defaults
      "SPRING_PROFILES_ACTIVE"     = "mysql"
      "SPRING_DATASOURCE_URL"      = "jdbc:mysql://${azurerm_mysql_server.default.fqdn}:3306/${azurerm_mysql_database.default.name}?useUnicode=true&characterEncoding=utf8&useSSL=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
      "SPRING_DATASOURCE_USERNAME" = "${azurerm_mysql_server.default.administrator_login}@${azurerm_mysql_server.default.name}"
    }

    secure_environment_variables = {
      "SPRING_DATASOURCE_PASSWORD" = random_password.admin_password.result
    }

    readiness_probe {
      http_get {
        path   = "/actuator/health"
        port   = var.application_port
        scheme = "Http"
      }
    }
  }


  tags = local.defaultTags
}
