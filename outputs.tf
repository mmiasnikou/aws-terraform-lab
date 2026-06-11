output "vpc_id" {
  value = aws_vpc.main.id
}

output "server_id" {
  value = aws_instance.server.id
}

output "agent_ids" {
  value = aws_instance.agent[*].id
}
