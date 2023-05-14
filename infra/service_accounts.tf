resource "google_service_account" "cloud-run-sa" {
  account_id = "selenium-cloud-run"
  display_name = "SELENIUM-CR"
}

resource "google_project_iam_member" "cloud-run-admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.cloud-run-sa.email}"
  depends_on = [google_service_account.cloud-run-sa]
}