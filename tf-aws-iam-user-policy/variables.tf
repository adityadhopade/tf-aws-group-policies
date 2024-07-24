variable "users" {
  description = "A map of IAM users to create"
  type        = map(string)
}

variable "policies" {
  description = "A map of IAM policies to create"
  type = map(object({
    description = string
    document = object({
      Version = string
      Statement = list(object({
        Effect   = string
        Action   = list(string)
        Resource = list(string)
      }))
    })
  }))
}

variable "user_policies" {
  description = "A map of users to their respective policies"
  type        = map(list(string))
}
