#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello from Scalable Web App!</h1><p>DB Endpoint: ${db_endpoint}</p>" > /var/www/html/index.html