resource "google_storage_bucket" "transfer-dest" {
  name          = "omar-doit-transfer-dest"
  location      = "US-SOUTH1"
  force_destroy = true

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

}

resource "google_storage_bucket_iam_policy" "sts-transfer" {
  bucket      = google_storage_bucket.transfer-dest.name
  policy_data = data.google_iam_policy.sts-transfer.policy_data
  depends_on = [
    google_storage_bucket.transfer-dest,
    data.google_iam_policy.sts-transfer
  ]
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = "omar-doit-transfer-src"
  acl           = "private"
  force_destroy = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }
}
