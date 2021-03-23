variable "do_token" {
  type        = string
  description = "DigitalOcean API Token"
}

variable "do_domain" {
  type        = string
  description = "Domain managed by DigitalOcean"
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription which should host these resources"
}

variable "tenant_id" {
  type        = string
  description = "Azure Active Directory Tenant ID"
}

variable "resource_group_name" {
  type    = string
  default = "rettiprod"
}

variable "location" {
  type        = string
  description = "The physical region/location"
}

variable "application_name" {
  type    = string
  default = "petclinic"
}

variable "application_port" {
  type    = string
  default = "5000"
}

variable "application_image" {
  type    = string
  default = "springio/petclinic:latest"
}

