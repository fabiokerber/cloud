packer {
  required_plugins {
    azure = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

variable "client_id" {
  type    = string
  default = "4b9cf9e2-ba75-48a0-b56d-ba0ab00083af"
}

variable "client_secret" {
  type    = string
  default = "4V67Q~CwjR16jokWxBD--NDHM0h1l~I5TtZ~x"
  sensitive = true
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "managed_image_name" {
  type    = string
  default = "vm-img-aa-awx-br-sh"
}

variable "managed_image_resource_group_name" {
  type    = string
  default = "rg-img-br-sh"
}

variable "offer" {
  type    = string
  default = "RHEL"
}

variable "publisher" {
  type    = string
  default = "RedHat"
}

variable "sku" {
  type    = string
  default = "7.8"
}

variable "subscription_id" {
  type    = string
  default = "ee6222a2-c6ac-48ae-b6ad-b7fef2589b74"
}

variable "tenant_id" {
  type    = string
  default = "51fd35eb-5f5d-4077-b2cb-6e257ba1a75a"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

source "azure-arm" "windowsvm" {
  async_resourcegroup_delete              = true
  client_id                               = var.client_id
  client_secret                           = var.client_secret
  communicator                            = "winrm"
  image_offer                             = var.offer
  image_publisher                         = var.publisher
  image_sku                               = var.sku
  location                                = var.location
  managed_image_name                      = var.managed_image_name
  managed_image_resource_group_name       = var.managed_image_resource_group_name
  os_type                                 = "Windows"
  private_virtual_network_with_public_ip  = "false"
  subscription_id                         = var.subscription_id
  tenant_id                               = var.tenant_id
  vm_size                                 = var.vm_size
  winrm_insecure                          = "true"
  winrm_timeout                           = "3m"
  winrm_use_ssl                           = "true"
  winrm_username                          = "packer"
}