# --- root/backends.tf ---

terraform {
  cloud {
    organization = "fks-course-terraform"

    workspaces {
      name = "k3s-env"
    }
  }
}