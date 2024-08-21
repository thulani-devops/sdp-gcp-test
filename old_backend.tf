# terraform {
#   backend "gcs" {
#     bucket = "pipeline-test-state-bucket"
#     prefix = "terraform/state"
#   }

#   # Use the Cloud Function for locking
#   backend "http" {
#     lock_address = "<Cloud Function URL>/lock"
#     unlock_address = "<Cloud Function URL>/unlock"
#     lock_method = "POST"
#     unlock_method = "POST"
#     lock_body = <<JSON
#     {
#       "lock_id": "my-lock"
#     }
#     JSON
#     unlock_body = <<JSON
#     {
#       "lock_id": "my-lock"
#     }
#     JSON
#   }
# }
