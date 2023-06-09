terraform {
  backend "remote" {
    hostname     = "buhidma.scalr.io"
    organization = "env-v0ntlps2lneout1l3"
    workspaces {
      name = "buhidma"
    }
  }
}

data "terraform_remote_state" "buhidma-scalr" {
  backend = "remote"
  config = {
    hostname     = "buhidma.scalr.io"
    organization = "env-v0ntlps2lneout1l3"
    workspaces = {
      name = "buhidma"
    }
  }
}