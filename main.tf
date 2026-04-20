terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.28.0"
    }
  }
}

terraform {
  backend "gcs" {
    bucket = "cruk-bucket-four"
    prefix = "terraform/state"
  }
}

module "cloud-storage_simple_bucket" {
  source        = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version       = "12.3.0"
  project_id    = "do-not-delete-444606"
  name          = var.name
  location      = "us-central1"
  force_destroy = false
  versioning    = true
  iam_members = [
    {
      role   = var.iam_members[0].role
      member = "user:${var.iam_members[0].member}"
    }
  ]
}