# outputs.tf

output "ec2_public_ip" {
  value       = aws_instance.nginx_instance.public_ip
  description = "Public IP address of the EC2 instance running Nginx"
}
