resource "google_storage_bucket" "function_source" {
  name     = "${var.pipeline_name}-approval-function-source-bucket"
  location = var.location
  force_destroy               = true
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_source.name
  source = data.archive_file.function_zip.output_path
}
