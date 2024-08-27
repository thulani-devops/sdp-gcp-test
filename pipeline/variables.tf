variable "project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "region" {
  type        = string
  description = "GCP Region your resources should be deployed in"
}

variable "location" {
  type        = string
  description = "GCP location your resources should be deployed in"
}

variable "pipeline_name" {
  type        = string
  description = "Name that will be used for creating most GCP resources for the pipeline"
}

variable "terraform_version" {
  type        = string
  description = "The Terraform version your pipeline should run in"
}

variable "branch" {
  type        = string
  description = "Branch of your repository the pipeline should point at"
}

variable "repository" {
  type        = string
  description = "Provide repository name"
}

variable "owner" {
  type        = string
  description = "Owner of git"
}

variable "terralist_token" {
  type        = string
  sensitive   = true
  description = "Terralist api key"
  default     = "91fa2034-6186-403c-8c46-0a6451b5c87f"
}

variable "infracost_api_key" {
  type        = string
  sensitive   = true
  description = "Infracost api key"
}