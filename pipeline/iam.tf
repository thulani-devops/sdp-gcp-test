resource "google_service_account" "custom_cloudbuild_sa" {
  account_id   = "${var.pipeline_name}-service-account"
  display_name = "${var.pipeline_name} Cloud Build Service Account"
}


resource "google_project_iam_custom_role" "cloudbuild_role" {
  role_id   = "${var.pipeline_name}-CloudBuildRole"
  title     = "Custom Cloud Build Role"
  project   = var.project_id
  permissions = [
    "cloudbuild.builds.create",
    "cloudbuild.builds.update",
    "cloudbuild.builds.list",
    "cloudbuild.builds.get",
    "cloudbuild.workerpools.use",
    "logging.logEntries.create",
    "logging.logEntries.list",
    "logging.views.access",
    "pubsub.topics.create",
    "pubsub.topics.publish",
    "remotebuildexecution.blobs.get",
    "resourcemanager.projects.get",
    "resourcemanager.projects.list",
    "source.repos.get",
    "source.repos.list",
    "storage.buckets.create",
    "storage.buckets.get",
    "storage.buckets.list",
    "storage.objects.list",
    "storage.objects.update",
    "storage.objects.create",
    "storage.objects.delete",
    "storage.objects.get",
    "artifactregistry.repositories.uploadArtifacts",
    "artifactregistry.repositories.downloadArtifacts",
    "artifactregistry.aptartifacts.create",
    "artifactregistry.dockerimages.get",
    "artifactregistry.dockerimages.list",
    "artifactregistry.kfpartifacts.create",
    "artifactregistry.locations.get",
    "artifactregistry.locations.list",
    "artifactregistry.mavenartifacts.get",
    "artifactregistry.mavenartifacts.list",
    "artifactregistry.npmpackages.get",
    "artifactregistry.npmpackages.list",
    "artifactregistry.projectsettings.get",
    "artifactregistry.pythonpackages.get",
    "artifactregistry.pythonpackages.list",
    "artifactregistry.yumartifacts.create",
    "artifactregistry.repositories.createOnPush",
    "artifactregistry.repositories.get",
    "artifactregistry.repositories.list",
    "artifactregistry.repositories.listEffectiveTags",
    "artifactregistry.repositories.listTagBindings",
    "artifactregistry.tags.create",
    "artifactregistry.tags.get",
    "artifactregistry.tags.list",
    "artifactregistry.tags.update",
    "artifactregistry.versions.list",
    "artifactregistry.versions.get",
    "containeranalysis.occurrences.create",
    "containeranalysis.occurrences.delete",
    "containeranalysis.occurrences.get",
    "containeranalysis.occurrences.list",
    "containeranalysis.occurrences.update"
  ]
}

resource "google_project_iam_member" "cloudbuild_role_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.cloudbuild_role.id
  member  = "serviceAccount:${google_service_account.custom_cloudbuild_sa.email}"
}
