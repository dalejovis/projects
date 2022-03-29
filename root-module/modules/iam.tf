resource "aws_iam_role" "role-joao" {
  name               = "role-joao-${var.env}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_iam_instance_profile" "role-joao" {
  name = "role-joao-${var.env}"
  role = aws_iam_role.role-joao.name
}

resource "aws_iam_role_policy_attachment" "role-joao-attachment" {
  role       = aws_iam_role.role-joao.name
  policy_arn = data.aws_iam_policy.amazon_ssm_managed_instance_core.arn
}