resource "google_storage_bucket" "auto-expire" {
  name          = "sdp-bucket"
  location      = "EUROPE-WEST1"
  force_destroy = true
}