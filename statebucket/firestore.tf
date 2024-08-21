# resource "google_project_service" "firestore" {
#   project = var.project_id
#   service = "firestore.googleapis.com"

#   # Ensure Firestore is enabled before proceeding
#   disable_on_destroy = false
# }

# resource "google_firestore_index" "terraform_locks" {
#   collection    = "${var.pipeline_name}_terraform_locks"
#   fields {
#     name       = "${var.pipeline_name}-state-lock"
#     order      = "ASCENDING"
#   }
#   project = var.project_id
# }


