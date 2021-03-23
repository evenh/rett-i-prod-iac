output "container_group_uri" {
  value = "http://${azurerm_container_group.app.fqdn}:${var.application_port}"
}

output "public_uri" {
  value = "http://${digitalocean_record.web.fqdn}:${var.application_port}"
}
