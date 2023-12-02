resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_firewall" "access-rules" {
  name        = "frontend-rules"
  network     = google_compute_network.vpc_network.name
  description = "Creates firewall rule targeting tagged frontend instances"

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_ranges = ["2.125.198.25/32"]
  target_tags   = ["frontend"]
}