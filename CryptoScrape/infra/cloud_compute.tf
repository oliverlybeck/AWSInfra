resource "google_compute_instance" "vm_fe" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  tags         = ["frontend", "test"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"

    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {

    }
  }
}

