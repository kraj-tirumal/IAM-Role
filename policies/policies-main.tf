variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "policy_document" {
  description = "The JSON policy document"
  type        = string
}

resource "aws_iam_policy" "example_policy" {
  name        = var.policy_name
  policy      = var.policy_document
}

output "arn" {
  value = aws_iam_policy.example_policy.arn
}
