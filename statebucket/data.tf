output "bucket_name" {
  value = google_storage_bucket.terraform_state.name
}

resource "random_id" "random_suffix" {
  byte_length = 5
}

# output "firestore_collection" {
#   value = "${var.pipeline_name}_terraform_locks"
# }

# output "function_url" {
#   value = google_cloudfunctions_function.terraform_lock.https_trigger_url
# }

# data "archive_file" "function_zip" {
#   type        = "zip"
#   source_dir  = "${path.module}/function-source"
#   output_path = "${path.module}/function-source.zip"
# }