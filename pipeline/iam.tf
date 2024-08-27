resource "google_service_account" "custom_cloudbuild_sa" {
  account_id   = "${var.pipeline_name}-service-account"
  display_name = "${var.pipeline_name} Cloud Build Service Account"
}

resource "google_project_iam_binding" "cloudbuild_permissions" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.editor"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "compute_admin" {
  project = var.project_id
  role    = "roles/compute.admin"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "pubsub_subscriber" {
  project = var.project_id
  role    = "roles/pubsub.subscriber"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "iam_service_account_admin" {
  project = var.project_id
  role    = "roles/iam.serviceAccountAdmin"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloud_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloud_functions_admin" {
  project = var.project_id
  role    = "roles/cloudfunctions.admin"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "cloud_sql_admin" {
  project = var.project_id
  role    = "roles/cloudsql.admin"

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}
