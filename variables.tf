# variables.tf

variable "aws_region" {
  description = "AWS region to deploy the resources"
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID of the EC2 instance"
  default     = "ami-078264b8ba71bc45e"  # Replace with an AMI ID available in your region
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
