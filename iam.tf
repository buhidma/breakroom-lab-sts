resource "aws_iam_user" "sts-transfer" {
  name = "sts-transfer"
  tags = {
    Service-Account = "sts-transfer"
  }
}

resource "aws_iam_access_key" "sts-transfer" {
  user = aws_iam_user.sts-transfer.name
  depends_on = [
    aws_iam_user.sts-transfer
  ]

}

resource "aws_iam_user_policy_attachment" "sts-transfer-s3-access" {
  user       = aws_iam_user.sts-transfer.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  depends_on = [
    aws_iam_user.sts-transfer
  ]
}

data "google_iam_policy" "sts-transfer" {
  binding {
    role = "roles/storage.admin"
    members = [
      data.terraform_remote_state.buhidma-scalr.outputs.sts-transfer-account, "user:omar@doit-intl.com",
    ]
  }

}