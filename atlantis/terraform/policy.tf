data "aws_iam_policy_document" "policy" {
  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["*"]
    actions   = ["*"]
  }
}

resource "aws_iam_policy" "s8-grant-administrator-access-policy" {
  name = "s8-grant-administrator-access-policy"
  description = "Grants administrator permissions to AWS infrastructure"

  policy = data.aws_iam_policy_document.policy.json

}
