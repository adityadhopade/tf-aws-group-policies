output "user_names" {
  description = "The names of the IAM users"
  value       = keys(aws_iam_user.this)
}

output "policy_arns" {
  description = "The ARNs of the IAM policies"
  value       = [for policy in aws_iam_policy.this : policy.arn]
}
