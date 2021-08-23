/////////////

provider "google" {
  project     = var.project
  region      = "europe-west2"
  zone        = "europe-west2a"
}


resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = "europe-west2-a"

  tags = ["test", "git", "app"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}