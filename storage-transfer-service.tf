data "google_storage_transfer_project_service_account" "sts-transfer" {

}

output "sts-transfer-account" {
  value = data.google_storage_transfer_project_service_account.sts-transfer.member
  depends_on = [
    data.google_storage_transfer_project_service_account.sts-transfer
  ]
}

resource "google_storage_transfer_job" "sts-transfer-300" {
  description = "Frequent Backup of S3 bucket"
  transfer_spec {
    aws_s3_data_source {
      bucket_name = module.s3_bucket.s3_bucket_id
      aws_access_key {
        access_key_id     = aws_iam_access_key.sts-transfer.id
        secret_access_key = aws_iam_access_key.sts-transfer.secret
      }
    }
    gcs_data_sink {
      bucket_name = google_storage_bucket.transfer-dest.name
      path        = "/"
    }
  }
  schedule {
    schedule_start_date {
      year  = 2023
      month = 5
      day   = 10
    }
    start_time_of_day {
      hours   = 20
      minutes = 45
      seconds = 0
      nanos   = 0
    }
    repeat_interval = "3600s"
  }
  depends_on = [
    google_storage_bucket.transfer-dest,
    google_storage_bucket_iam_policy.sts-transfer,
    aws_iam_user_policy_attachment.sts-transfer-s3-access,
    aws_iam_access_key.sts-transfer,
    module.s3_bucket,
    google_project_service.storage-transfer
  ]
}