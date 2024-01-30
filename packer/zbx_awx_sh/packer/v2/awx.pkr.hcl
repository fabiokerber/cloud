source "azure-arm" "awx" {
  subscription_id                         = "ee6222a2-c6ac-48ae-b6ad-b7fef2589b74"
  tenant_id                               = "51fd35eb-5f5d-4077-b2cb-6e257ba1a75a"
  client_id                               = "4b9cf9e2-ba75-48a0-b56d-ba0ab00083af"
  client_secret                           = "4V67Q~CwjR16jokWxBD--NDHM0h1l~I5TtZ~x"
  image_offer                             = "RHEL"
  image_publisher                         = "RedHat"
  image_sku                               = "7.8"
  location                                = "brazilsouth"
  os_type                                 = "Linux"
  vm_size                                 = "Standard_B2s"
  managed_image_name                      = "vm-img-bc-awx-br-sh"
  managed_image_resource_group_name       = "rg-img-br-sh"
}

build {
  sources = ["source.azure-arm.awx"]
  provisioner "shell-local" {
    inline = [
      "echo \"aaaaaa\" > /tmp/example.txt",
    ]
  }
}