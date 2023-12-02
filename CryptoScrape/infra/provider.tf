terraform {
  required_version = ">= 0.12"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  backend "gcs" {
    bucket      = "terraform-backend-kubernetes-infra-384113"
    credentials = "../kubernetes-infra-384113-b318daa522fc.json"
  }
}
