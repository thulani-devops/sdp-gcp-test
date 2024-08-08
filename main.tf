resource "google_storage_bucket" "auto-expire" {
  name          = "sdp-bucket-458215669694425"
  location      = "EUROPE-WEST1"
  force_destroy = true
}