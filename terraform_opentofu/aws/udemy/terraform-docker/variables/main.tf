terraform {
  required_providers {
    docker = {
        source = "terraform-providers/docker"
        version = "~> 2.7.2"
    }
  }
}

variable "container_count" {
  type = number
  default = 2
}

variable "int_port" {
  type = number
  default = 1880
}

variable "ext_port" {
  type = number
  default = 1880
}

provider "docker" {}

resource "docker_image" "nodered_image" {
    name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count = var.container_count
  length = 4
  special = false
  upper = false
}

resource "docker_container" "nodered_container" {
  count = var.container_count
  name = join("-",["nodered", random_string.random[count.index].result])
  image = docker_image.nodered_image.latest
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}

output "container-name" {
  value = docker_container.nodered_container[*].name
  description = "The name of the container"
}

output "ip-address" {
  value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address], i.ports[*]["external"])]
  description = "The IP address and port of the container"
}


