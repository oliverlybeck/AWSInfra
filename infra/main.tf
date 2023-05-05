provider "google" {
  credentials = file(var.auth_file)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}