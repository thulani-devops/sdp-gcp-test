resource "google_pubsub_topic" "approval_topic" {
  name = "${var.pipeline_name}-manual-approval-topic"
  project  = var.project_id
}

resource "google_pubsub_subscription" "approval_subscription" {
  name  = "${var.pipeline_name}-manual-approval-subscription"
  topic = google_pubsub_topic.approval_topic.id
}
