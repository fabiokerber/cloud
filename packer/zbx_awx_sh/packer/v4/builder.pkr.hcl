build {
  name    = "builder"
  sources = ["source.azure-arm.awx"]
  provisioner "shell" {
    script       = "script/awx.sh"
    pause_before = "1m"
    pause_after  = "1m"
    timeout      = "2m"
  }
}