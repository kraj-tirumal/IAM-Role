variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "policies" {
  description = "A map of policies to attach to the IAM role"
  type        = map
}
