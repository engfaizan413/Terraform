#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1>Hello from Faizan from AWS amazon Linux Machine</h1>" > /var/www/html/index.html