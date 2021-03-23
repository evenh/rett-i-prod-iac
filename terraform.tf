terraform {
  required_version = "0.14.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.6.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

provider "digitalocean" {
  token = var.do_token
}
