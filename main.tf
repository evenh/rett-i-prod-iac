locals {
  defaultTags = {
    "managed-by" = "Terraform",
    "team"       = "Rett i prod"
    "company"    = "Bekk"
  }
}

resource "azurerm_resource_group" "default" {
  name     = var.resource_group_name
  location = var.location

  tags = local.defaultTags
}
