# resource "google_cloudfunctions_function" "terraform_lock" {
#   name        = "${var.pipeline_name}-terraform-lock"
#   description = "Cloud Function for managing Terraform state locks"
#   runtime     = "python311"
#   available_memory_mb   = 128
#   source_archive_bucket = google_storage_bucket.function_source.name
#   source_archive_object = google_storage_bucket_object.function_zip.name
#   trigger_http          = true
#   entry_point           = "app"
#   region                = var.region

#   environment_variables = {
#     COLLECTION = "${var.pipeline_name}_terraform_locks"
#   }
# }

# resource "google_cloudfunctions_function_iam_member" "noauth_invoker" {
#   project        = google_cloudfunctions_function.terraform_lock.project
#   region         = google_cloudfunctions_function.terraform_lock.region
#   cloud_function = google_cloudfunctions_function.terraform_lock.name
#   role           = "roles/cloudfunctions.invoker"
#   member         = "allUsers"
# }

