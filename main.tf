module "tf_pipeline" {
  source                              = "./pipeline"
  project_id                          = var.project_id
  region                              = var.region
  pipeline_name                       = var.pipeline_name
  terraform_version                   = var.terraform_version
  repository                          = var.repository
  branch                              = var.branch
  owner                               = var.owner
  infracost_api_key                   = var.infracost_api_key
  location                            = var.location
}

module "tf_state" {
  source                              = "./statebucket"
  project_id                          = var.project_id
  pipeline_name                       = var.pipeline_name
  location                            = var.location
}

resource "local_file" "default" {
  file_permission = "0644"
  filename        = "backend.tf"
  content = <<-EOT
  terraform {
    backend "gcs" {
      bucket = "${module.tf_state.bucket_name}"
    }
  }
  EOT
}