locals {
  image = "gcr.io/${var.project_id}/${var.pipeline_name}-image:latest"
  branch = "^${var.branch}$"
}

data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/function-source"
  output_path = "${path.module}/function-source.zip"
}
