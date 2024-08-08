terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.40.0"
    }
  }
}

provider "google" {
  project     = "general-dev-372307"
  region      = "EUROPE-WEST1"
}