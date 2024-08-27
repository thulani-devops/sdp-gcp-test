variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "pipeline_name" {
  type        = string
  description = "Name that will be used for creating most GCP resources for the pipeline"
}

# variable "region" {
#   type        = string
#   description = "GCP Region your resources should be deployed in"
# }

variable "location" {
  type        = string
  description = "GCP location your resources should be deployed in"
}