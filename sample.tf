module "iam_users" {
  source = "./tf-aws-iam-user-policy"

  users = {
    "user1" = "User 1 description"
    "user2" = "User 2 description"
  }

  policies = {
    "policy1" = {
      description = "Policy 1 description"
      document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect   = "Allow"
            Action   = ["s3:ListBucket"]
            Resource = ["arn:aws:s3:::example-bucket"]
          }
        ]
      }
    },
    "policy2" = {
      description = "Policy 2 description"
      document = {
        Version = "2012-10-17"
        Statement = [
          {
            Effect   = "Allow"
            Action   = ["ec2:DescribeInstances"]
            Resource = ["*"]
          }
        ]
      }
    }
  }

  user_policies = {
    "user1" = ["policy1", "policy2"]
    "user2" = ["policy1"]
  }
}
