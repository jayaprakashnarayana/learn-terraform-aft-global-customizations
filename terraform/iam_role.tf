data "aws_caller_identity" "aws_caller_identity" {}

#resource "aws_iam_role" "test_role" {
#  name = "${data.aws_caller_identity.aws_caller_identity.account_id}-admin-role"
#  assume_role_policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#      {
#        Action = "sts:AssumeRole"
#        Effect = "Allow"
#        Principal = {
#          AWS = ["008298205562"]
#        }
#      },
#    ]
#  })
#  managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
#  tags = {
#    tag-key = "${data.aws_caller_identity.aws_caller_identity.account_id}-admin-role"
#  }
#}
