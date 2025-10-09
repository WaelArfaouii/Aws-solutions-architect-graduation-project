#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Get EC2 instance ID (unique per instance)
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

echo "<html>
  <body>
    <h1>Hello from Scalable Web App!</h1>
    <p>Instance ID: $${INSTANCE_ID}</p>
    <p>DB Endpoint: ${db_endpoint}</p>
  </body>
</html>" > /var/www/html/index.html
