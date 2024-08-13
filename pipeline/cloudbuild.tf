resource "google_cloudbuild_trigger" "trigger" {
  name = "${var.pipeline_name}-trigger"
  location = "global"
  github {
    owner = var.owner
    name  = var.repository
    push {
      branch = local.branch 
    }
  }

#   trigger_template {
#     branch_name = var.branch
#     repo_name   = var.repository
#   }

#   filename = data.template_file.cloudbuild.rendered
  build {
    step {
      id = "terraform init"
      name = local.image
      entrypoint = "sh"
      args = [
        "-c",
        "terraform init && terraform validate && echo terraform initialized"
      ]
    }
    step {
      id = "terraform plan and checkov"
      name = local.image
      entrypoint = "sh"
      args = [
        "-c",
        "terraform plan --out tfplan.binary && terraform show -json tfplan.binary > tfplan.json && checkov -f tfplan.json || true && echo terraform plan and Checkov completed on `date`"
      ]
    }
    step {
      id = "infracost"
      name = local.image
      entrypoint = "sh"
      args = [
        "-c",
        "export INFRACOST_TERRAFORM_CLOUD_TOKEN=\"x-api-key:${var.terralist_token}\" && export INFRACOST_TERRAFORM_CLOUD_HOST=\"terralist.tooling.synthesize.co.za\" && infracost configure set api_key ${var.infracost_api_key} && infracost breakdown --path ."
      ]
    }
    step {
      id = "terraform apply"
      name = local.image
      entrypoint = "sh"
      args = [
        "-c",
        "terraform apply --auto-approve && echo terraform apply and Checkov completed on `date`"
      ]
    }
    
  }
  depends_on = [
    null_resource.docker_terraform
  ]
}