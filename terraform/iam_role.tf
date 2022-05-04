data "aws_caller_identity" "aws_caller_identity" {}
data "aws_organizations_organization" "aws_organizations_organization" {}

resource "aws_iam_role" "admin_role" {
  name = "admin-xa-role"
  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Action    = "sts:AssumeRole",
        Principal = { "AWS" : "arn:aws:iam::312506926764:root" }
      }]
  })
}
