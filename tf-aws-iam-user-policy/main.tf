resource "aws_iam_user" "this" {
  for_each = var.users
  name     = each.key
}

resource "aws_iam_policy" "this" {
  for_each = var.policies

  name        = each.key
  description = each.value.description
  policy      = jsonencode(each.value.document)
}

resource "aws_iam_user_policy" "this" {
  for_each = { for user, user_policies in var.user_policies : user => user_policies if length(user_policies) > 0 }

  name = "${each.key}-policy"
  user = aws_iam_user.this[each.key].name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      for policy in each.value : {
        Effect   = var.policies[policy].document.Statement[0].Effect
        Action   = var.policies[policy].document.Statement[0].Action
        Resource = var.policies[policy].document.Statement[0].Resource
      }
    ]
  })
}
