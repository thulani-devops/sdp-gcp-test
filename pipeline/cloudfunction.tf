resource "google_cloudfunctions_function" "manual_approval_function" {
  name                  = "${var.pipeline_name}-manual-approval-function"
  runtime               = "python311"  # Choose appropriate runtime
  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.function_source.name
  source_archive_object = google_storage_bucket_object.function_zip.name
  entry_point           = "approval_handler"

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.approval_topic.id
  }
}

