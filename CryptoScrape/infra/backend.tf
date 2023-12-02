# # Create a GCS Bucket
# resource "google_storage_bucket" "tf-backend-bucket" {
#   project       = var.project_id
#   name          = var.backend-bucket-name
#   location      = var.region
#   force_destroy = true
#   storage_class = var.storage-class
#   versioning {
#     enabled = true
#   }
# }