resource "aws_instance" "server" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.nodes.id]
  iam_instance_profile   = aws_iam_instance_profile.node.name
  tags                   = { Name = "${var.project}-server", Role = "server" }
}

resource "aws_instance" "agent" {
  count                  = var.agent_count
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.nodes.id]
  iam_instance_profile   = aws_iam_instance_profile.node.name
  tags                   = { Name = "${var.project}-agent-${count.index + 1}", Role = "agent" }
}
