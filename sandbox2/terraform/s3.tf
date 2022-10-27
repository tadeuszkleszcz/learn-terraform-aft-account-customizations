data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "sandbox_bucket3" {
  bucket = "aft-sandbox3-${data.aws_caller_identity.current.account_id}"
  acl    = "private"
}
