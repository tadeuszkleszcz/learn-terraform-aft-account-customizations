data "aws_iam_policy_document" "assume_policy" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::634527145633:root",
        "arn:aws:iam::${var.atlantis_aws_account_id}:role/${var.atlantis_iam_role_name}",
        "arn:aws:iam::${var.atlantis_aws_account_id}:role/${var.atlantis_iam_prod_role_name}",
      ]
    }
  }
}

# data "aws_iam_policy_document" "policy" {
#   statement {
#     sid     = "AllowAssumeByAtlantisRole"
#     effect  = "Allow"
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${var.atlantis_aws_account_id}:role/${var.atlantis_iam_role_name}"]
#     }
#   }

#   statement {
#     sid     = ""
#     effect  = "Allow"
#     actions = ["sts:AssumeRole"]

#     condition {
#       test     = "Bool"
#       variable = "aws:SecureTransport"
#       values   = ["true"]
#     }

#     condition {
#       test     = "Bool"
#       variable = "aws:MultiFactorAuthPresent"
#       values   = ["true"]
#     }

#     condition {
#       test     = "NumericLessThan"
#       variable = "aws:MultiFactorAuthAge"
#       values   = ["${var.ts_administrator_role_max_mfa_session_time}"]
#     }

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::${var.authorised_aws_account_id}:root"]
#     }
#   }

#   statement {
#     sid     = ""
#     effect  = "Allow"
#     actions = ["sts:AssumeRoleWithSAML"]

#     condition {
#       test     = "StringEquals"
#       variable = "SAML:aud"
#       values   = ["https://signin.aws.amazon.com/saml"]
#     }

#     principals {
#       type        = "Federated"
#       identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:saml-provider/silent8.okta.com"]
#     }
#   }
# }
