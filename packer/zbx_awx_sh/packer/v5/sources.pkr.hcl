locals {
  now         = timestamp()
  brasilia_tz = timeadd(local.now, "-3h") # Brazil's official time
  date_br     = formatdate("DDMMYYYYhhmm", local.brasilia_tz)
}

source "azure-arm" "awx" {
  subscription_id                   = "${var.subscription_id}"
  tenant_id                         = "${var.tenant_id}"
  client_id                         = "${var.client_id}"
  client_secret                     = "${var.client_secret}"
  image_offer                       = "${var.image_offer}"
  image_publisher                   = "${var.image_publisher}"
  image_sku                         = "${var.image_sku}"
  location                          = "${var.location}"
  os_type                           = "${var.os_type}"
  temp_compute_name                 = "${var.temp_compute_name}"
  vm_size                           = "${var.vm_size}"
  managed_image_name                = "img-${local.date_br}-${var.temp_compute_name}"
  managed_image_resource_group_name = "${var.managed_image_resource_group_name}"
}