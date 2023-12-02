output "service_url" {
  value = google_cloud_run_service.selenium_server.status[0].url
}