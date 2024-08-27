resource "google_service_account" "custom_cloudbuild_sa" {
  account_id   = "${var.pipeline_name}-service-account"
  display_name = "${var.pipeline_name} Cloud Build Service Account"
}
