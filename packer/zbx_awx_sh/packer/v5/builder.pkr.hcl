build {
  name    = "builder"
  sources = ["source.azure-arm.awx"]
  provisioner "ansible" {
    playbook_file = "ansible/playbook.yml"
    pause_before  = "1m"
    timeout       = "40m"
  }
}