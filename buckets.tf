resource "google_storage_bucket" "transfer-source" {
  name          = "omar-doit-transfer-source"
  location      = "US-SOUTH1"
  force_destroy = true

  uniform_bucket_level_access = true
  public_access_prevention = "enforced"

}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "omar-doit-transer-dest"
  acl    = "private"
  force_destroy = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }
}