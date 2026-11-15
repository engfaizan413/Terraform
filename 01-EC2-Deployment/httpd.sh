#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello from Amazon Linux 2023</h1>" > /var/www/html/index.html
