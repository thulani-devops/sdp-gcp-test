resource "google_storage_bucket" "terraform_state" {
  name     = "${var.pipeline_name}-state-bucket-${random_id.random_suffix.hex}" #-${random_id.random_suffix.hex}
  location = var.location

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

# resource "google_storage_bucket" "function_source" {
#   name     = "${var.pipeline_name}-lock-function-source-bucket"
#   location = var.location
# }

# resource "google_storage_bucket_object" "function_zip" {
#   name   = "function-source.zip"
#   bucket = google_storage_bucket.function_source.name
#   source = data.archive_file.function_zip.output_path
# }



# resource "local_file" "default" {
#   file_permission = "0644"
#   filename        = "${path.module}/backend.tf"
#   content = <<-EOT
#   terraform {
#     backend "gcs" {
#       bucket = "${google_storage_bucket.terraform_state.name}"
#     }
#   }
#   EOT
# }
