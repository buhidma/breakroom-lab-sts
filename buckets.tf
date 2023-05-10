resource "google_storage_bucket" "transfer-source" {
  name          = "transfer-source"
  location      = "US-SOUTH1"
  force_destroy = false

  uniform_bucket_level_access = true
  public_access_prevention = "enforced"

}