resource "aws_iam_role" "example_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

module "policies" {
  source = "./policies"
  policies = var.policies
}

resource "aws_iam_role_policy_attachment" "policy_attachments" {
  for_each = var.policies

  policy_arn = module.policies[each.value].arn
  role       = aws_iam_role.example_role.name
}
