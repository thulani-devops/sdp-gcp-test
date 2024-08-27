variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "general-dev-372307"
}

# variable "region" {
#   type        = string
#   description = "GCP Region your resources should be deployed in"
#   default     = "EUROPE-WEST1"
# }

variable "region" {
  type        = string
  description = "GCP Region your resources should be deployed in"
  default     = "europe-west1"
}

variable "pipeline_name" {
  type        = string
  description = "Name that will be used for creating most GCP resources for the pipeline"
  default     = "pipeline-test"
}

variable "location" {
  type        = string
  description = "GCP location your resources should be deployed in"
  default     = "EU"
}

variable "terraform_version" {
  type        = string
  description = "The Terraform version your pipeline should run in"
  default     = "1.8.3"
}

variable "branch" {
  type        = string
  description = "Branch of your repository the pipeline should point at"
  default     = "dev"
}

variable "repository" {
  type        = string
  description = "Provide repository name"
  default     = "sdp-gcp-test"
}

variable "owner" {
  type        = string
  description = "Owner of git"
  default     = "thulani-devops"
}

variable "infracost_api_key" {
  type        = string
  sensitive   = true
  description = "Infracost api key"
  default     = "ico-LESrGSOlsI7xz9bPk4dNaF2eUtzb8Mi5"
}