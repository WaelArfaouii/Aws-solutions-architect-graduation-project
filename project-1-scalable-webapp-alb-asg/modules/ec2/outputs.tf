output "instance_id" {
  value = aws_instance.web.id
}

output "sg_id" {
  value = aws_security_group.web.id
}