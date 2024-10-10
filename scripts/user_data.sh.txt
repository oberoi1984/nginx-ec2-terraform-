#!/bin/bash
# Update and install necessary packages
sudo yum update -y
sudo yum install -y docker

# Start Docker service
sudo service docker start

# Add the ec2-user to the docker group
sudo usermod -a -G docker ec2-user

# Pull and run the Nginx Docker container
sudo docker run -d -p 80:80 --name nginx-container nginx
