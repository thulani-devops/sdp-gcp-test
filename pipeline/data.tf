locals {
  image = "gcr.io/${var.project_id}/${var.pipeline_name}-image:latest"
}

data "template_file" "codebuild" {
  template = file("${path.module}/codebuild.yaml")

  vars = {
    IMAGE   = local.image
  }
}
