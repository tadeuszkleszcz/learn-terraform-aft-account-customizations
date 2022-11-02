data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "storage_bucket" {
  bucket = "aft-storage-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
}
