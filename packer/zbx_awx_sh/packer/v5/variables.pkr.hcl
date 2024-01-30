# ID's
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

# IMAGE
variable "image_offer" {
  type = string
}

variable "image_publisher" {
  type = string
}

variable "image_sku" {
  type = string
}

# GENERAL
variable "location" {
  type = string
}

variable "os_type" {
  type = string
}

variable "temp_compute_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "managed_image_resource_group_name" {
  type = string
}