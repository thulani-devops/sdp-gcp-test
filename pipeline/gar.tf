resource "google_container_registry" "default" {
  project = var.project_id
  #location = var.location
}

# resource "google_artifact_registry_repository" "repo" {
#   repository_id = "${var.pipeline_name}-image"
#   description   = "pipeline-image"
#   format        = "DOCKER"
# }


resource "null_resource" "docker_terraform" {
  provisioner "local-exec" {
    command = <<EOT
      # Authenticate Docker to GCR
      gcloud auth configure-docker --quiet

      # Build the Docker image
      docker build --build-arg terraform_version=${var.terraform_version} -t ${local.image} -f ${path.module}/docker-src/Dockerfile_Terraform .

      # Push the Docker image to GCR
      docker push ${local.image}
    EOT
  }
}
