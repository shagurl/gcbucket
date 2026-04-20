terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.28.0"
    }
  }
}

resource "google_storage_bucket" "crukbackend" {
  name = "cruk-bkt-backend"
  location = "US"
  uniform_bucket_level_access = true

}

terraform {
  backend "gcs" {
    bucket  = "cruk-bkt-backend"
    prefix  = "terraform/state"
  }
}