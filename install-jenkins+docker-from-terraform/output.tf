output "instance_public_ip" {
  description = "Instance Punlic IP"
  value       = aws_instance.jenkins_server.public_ip
}
