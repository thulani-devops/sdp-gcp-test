locals {
  image = "gcr.io/${var.project_id}/${var.pipeline_name}-image:latest"
  branch = "^${var.branch}$"
}

data "template_file" "cloudbuild" {
  template = file("${path.module}/cloudbuild.yaml")

  vars = {
    IMAGE   = local.image
  }
}
