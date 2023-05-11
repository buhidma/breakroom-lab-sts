terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "<= 4.64.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}