provider "google" {
  credentials = file(var.auth_file)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}