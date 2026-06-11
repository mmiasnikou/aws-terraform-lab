resource "aws_iam_role" "node" {
  name = "${var.project}-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  tags = { Name = "${var.project}-node-role" }
}

resource "aws_iam_instance_profile" "node" {
  name = "${var.project}-node-profile"
  role = aws_iam_role.node.name
}
