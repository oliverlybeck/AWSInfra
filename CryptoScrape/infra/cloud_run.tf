resource "google_cloud_run_service" "selenium_server" {
  name     = "selenium-server"
  location = var.region

  template {
    spec {
    #   service_account_name = google_service_account.cloud-run-sa.email
      containers {
        image = "selenium/standalone-chrome:latest"
        ports {
            container_port = 4444
        }
      }
    }
  }


  traffic {
    percent         = 100
    latest_revision = true
  }
  depends_on = [google_project_service.run_api, google_service_account.cloud-run-sa]
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.selenium_server.location
  project  = google_cloud_run_service.selenium_server.project
  service  = google_cloud_run_service.selenium_server.name

  policy_data = data.google_iam_policy.noauth.policy_data
}