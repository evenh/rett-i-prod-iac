data "digitalocean_domain" "default" {
  name = var.do_domain
}

resource "digitalocean_record" "web" {
  domain = data.digitalocean_domain.default.name
  type   = "CNAME"
  name   = "rett-i-prod"
  ttl    = 60
  value  = "${azurerm_container_group.app.fqdn}."
}
