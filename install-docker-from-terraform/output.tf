output "instance_public_ip" {
  description = "Instance Punlic IP"
  value       = aws_instance.prod_server.public_ip
}
