data "aws_caller_identity" "aws_caller_identity" {}
data "aws_organizations_organization" "aws_organizations_organization" {}

resource "aws_iam_role" "test_role" {
  for_each = toset(data.aws_organizations_organization.aws_organizations_organization.accounts[*].id)
  name = "${each.value}-admin-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = ["${toset(data.aws_organizations_organization.aws_organizations_organization.accounts[*].id)}"]
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  tags = {
    tag-key = "${each.value}-admin-role"
  }
}
