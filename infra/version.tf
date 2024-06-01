terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "cloud_republic"
    workspaces {
      name = "value"
    }
  }
}