#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo "<html><h1>This is my Week 21 project</h1></html>" > /var/www/html/index.html