output "image_out" {
    value = docker_image.nodered_image.latest
    description = "The name of the image container"
}

output "ip-address" {
    value = [for i in docker_container.nodered_container[*]: join(":", [i.ip_address], i.ports[*]["external"])]
    description = "The IP address and port of the container"
}