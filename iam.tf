provider "aws" {
  region = "us-east-1"
}
resource "aws_iam_user" "dim" {
  name = "loadbalancer"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "dim" {
  user = aws_iam_user.dim.name
}

data "aws_iam_policy_document" "dim_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "dim_ro" {
  name   = "test"
  user   = aws_iam_user.dim.name
  policy = data.aws_iam_policy_document.dim_ro.json
}
