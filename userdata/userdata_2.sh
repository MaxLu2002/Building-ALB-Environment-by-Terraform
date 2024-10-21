#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras enable nginx1
sudo yum install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl reload nginx
echo "<h1>Hello, Welcome to EC2-2!</h1>" | sudo tee /usr/share/nginx/html/index.html
