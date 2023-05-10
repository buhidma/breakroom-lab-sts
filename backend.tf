terraform {
  backend "remote" {
    hostname = "buhidma.scalr.io"
    organization = "buhidma"
    workspaces {
      name = "buhidma"
    }
  }
}
