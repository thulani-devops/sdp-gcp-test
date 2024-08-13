module "tf_pipeline" {
  source                              = "./pipeline"
  project_id                          = var.project_id
  region                              = var.region
  pipeline_name                       = var.pipeline_name
  #location                            = var.location
  terraform_version                   = var.terraform_version
  repository                          = var.repository
  branch                              = var.branch
  owner                               = var.owner
  infracost_api_key                   = var.infracost_api_key
}