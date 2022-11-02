resource "aws_iam_role" "AdministratorRole" {
  name = var.role_name
  assume_role_policy   = data.aws_iam_policy_document.assume_policy.json
  path = "/"
}

resource "aws_iam_policy_attachment" "s8-grant-administrator-access-policy_attachment" {
  name       = "s8-grant-administrator-access-policy_attachment"
  roles      = [aws_iam_role.AdministratorRole.name]
  policy_arn = aws_iam_policy.s8-grant-administrator-access-policy.arn
}

# data "aws_iam_policy_document" "policy" {
#   statement {
#     sid     = "AllowAssumeFromIsecCiCdAccount"
#     effect  = "Allow"
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "AWS"
#       identifiers = ["arn:aws:iam::928573754510:role/ts_all_isec_codebuild_role"]
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
#       identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:saml-provider/tradeshift.okta.com"]
#     }
#   }
# }
