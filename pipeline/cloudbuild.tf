resource "google_cloudbuild_trigger" "trigger_github" {
  name = "${var.pipeline_name}-trigger"

  github {
    owner = "gerhard@synthesis.co.za"
    name  = var.repository
    push {
      branch = var.branch
    }
  }

  filename = data.template_file.infracost_template.rendered
}