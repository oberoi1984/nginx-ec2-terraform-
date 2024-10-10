# main.tf

provider "aws" {
  region = var.aws_region
}

# Create a security group to allow SSH and HTTP access
resource "aws_security_group" "nginx_sg" {
  name_prefix = "nginx-sg-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}

# Create an EC2 instance
resource "aws_instance" "nginx_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]

  user_data = file("scripts/user_data.sh")

  tags = {
    Name = "nginx-ec2-instance"
  }

  # Associate public IP address
  associate_public_ip_address = true
}

# Output the public IP of the instance
output "ec2_public_ip" {
  value = aws_instance.nginx_instance.public_ip
  description = "Public IP address of the EC2 instance running Nginx"
}
