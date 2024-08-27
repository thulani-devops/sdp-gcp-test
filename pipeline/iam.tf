resource "google_project_iam_binding" "cloudbuild_permissions" {
  project = var.project_id
  role    = "roles/cloudbuild.builds.editor" # Required for Cloud Build

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin" # For accessing GCS buckets

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "compute_network_user" {
  project = var.project_id
  role    = "roles/compute.networkUser" # For using VPCs and other networking resources

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "artifact_registry_reader" {
  project = var.project_id
  role    = "roles/artifactregistry.reader" # Access to Artifact Registry

  members = [
    "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}",
  ]
}

resource "google_project_iam_binding" "service_account_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser" # Required for impersonating service accounts

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

