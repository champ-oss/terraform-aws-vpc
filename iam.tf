resource "aws_iam_role" "this" {
  name_prefix        = "${var.git}-vpc-flow-logs-"
  assume_role_policy = data.aws_iam_policy_document.assume.json
  tags               = merge(local.tags, var.tags)
}

data "aws_iam_policy_document" "assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["vpc-flow-logs.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role_policy" "this" {
  name_prefix = "${var.git}-vpc-flow-logs-"
  role        = aws_iam_role.this.id
  policy      = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    resources = ["*"]
  }
}