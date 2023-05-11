resource "google_storage_bucket" "transfer-dest" {
  name          = "omar-doit-transfer-dest"
  location      = "US-SOUTH1"
  force_destroy = true

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = "omar-doit-transer-src"
  acl           = "private"
  force_destroy = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }
}