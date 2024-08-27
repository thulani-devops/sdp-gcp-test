resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "${var.pipeline_name}-image"
  description   = "Docker image repository for ${var.pipeline_name}"
  format        = "DOCKER"
}

resource "null_resource" "docker_terraform" {
  provisioner "local-exec" {
    command = <<EOT
      # Authenticate Docker to Artifact Registry
      gcloud auth configure-docker ${var.region}-docker.pkg.dev --quiet

      # Build the Docker image
      docker build --build-arg terraform_version=${var.terraform_version} -t ${local.image} -f ${path.module}/docker-src/Dockerfile_Terraform .

      # Push the Docker image to Artifact Registry
      docker push ${local.image}
    EOT
  }
  triggers = {
    "run_at" = timestamp()
  }

  depends_on = [
    google_artifact_registry_repository.repo,
  ]
}

