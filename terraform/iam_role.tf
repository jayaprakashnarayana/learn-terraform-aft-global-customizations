data "aws_caller_identity" "aws_caller_identity" {}

resource "aws_iam_role" "admin_role" {
  name = "admin-xa-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Principal = { "AWS" : "arn:aws:iam::${data.aws_caller_identity.aws_caller_identity.account_id}:root" }
      }]
  })
}
