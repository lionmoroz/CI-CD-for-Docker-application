resource "google_cloud_run_service" "my-service" {
  name     = var.instance_name
  location = "europe-west1"

  template {
  spec {
    containers {
              image = "gcr.io/cloudrun/hello"            
        ports {
          container_port = 80
        }
    }
  }


  }

  # ignore changes to the image tag when updating the service
  lifecycle {
    ignore_changes = [
      template[0].spec[0].containers[0].image,
    ]
  }
}

resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.my-service.name
  location = google_cloud_run_service.my-service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = "f1-micro"
  zone         = var.zone


  boot_disk {
    initialize_params {
      image = "debian-11"
    }
  }

  network_interface {
    network = "default"
    subnetwork = var.subnetwork
    access_config {}
  }

  tags = ["http-server"]


  metadata_startup_script = "${file("${var.script_file}")}"


  service_account {
    email = var.client_email
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
