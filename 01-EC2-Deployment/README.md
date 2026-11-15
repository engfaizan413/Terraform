# Terraform AWS EC2 Deployment with Apache

## Project Overview

This project demonstrates how to provision an AWS EC2 instance using Terraform and automate the installation and configuration of Apache HTTP Server using EC2 User Data.

The objective is to implement Infrastructure as Code (IaC) by automating EC2 provisioning and web server configuration.

## Technologies Used

- **Cloud Provider:** AWS
- **Infrastructure as Code:** Terraform
- **Operating System:** Amazon Linux 2023
- **Web Server:** Apache HTTP Server (HTTPD)
- **Scripting:** Bash
- **Version Control:** Git & GitHub

## Infrastructure Configuration

| Component      | Configuration               |
| -------------- | --------------------------- |
| AWS Region     | us-east-1                   |
| EC2 Instance   | t3.micro                    |
| AMI            | Amazon Linux 2023           |
| Key Pair       | EC2_kp                      |
| Security Group | Existing EC2 Security Group |
| Web Server     | Apache HTTP Server          |
| HTTP Port      | 80                          |

## Project Structure

```text
terraform-aws-ec2/
│
├── images/
│   ├── ec2-instance.png
│   ├── terraform-apply.png
│   └── apache-output.png
│
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── httpd.sh
├── .gitignore
└── README.md
```

## How It Works

1. Terraform connects to AWS using the AWS provider.
2. An EC2 instance is provisioned using the specified AMI and instance type.
3. Terraform passes the `httpd.sh` script through EC2 User Data.
4. Cloud-init executes the script during the instance's initial boot.
5. Apache HTTP Server is installed, started, and enabled.
6. A custom HTML page is created and served through Apache.

## User Data Script

The `httpd.sh` script automates Apache installation and configuration.

```bash
#!/bin/bash

dnf update -y
dnf install -y httpd

systemctl start httpd
systemctl enable httpd

echo "<h1>Hello from Amazon Linux 2023</h1>" > /var/www/html/index.html
```

## Screenshots

### 1. Terraform Deployment

![Terraform Deployment](images/Terraform_Apply_1.png)

### 2. EC2 Instance

![EC2 Instance](images/Instance.png)

### 3. Apache Web Server Output

![Apache Output](images/Apache_Output.png)

## Deployment Instructions

Make sure AWS credentials are configured before running Terraform.

**Initialize Terraform:**

```bash
terraform init
```

**Validate Configuration:**

```bash
terraform validate
```

**Review Execution Plan:**

```bash
terraform plan
```

**Deploy Infrastructure:**

```bash
terraform apply
```

After deployment, access the EC2 public IP through a web browser using HTTP:

```text
http://intance_public_ip
```

Expected output:

**Hello from Amazon Linux 2023**

## Cleanup

To remove the resources created by Terraform:

```bash
terraform destroy
```

## Key Learnings

- Understanding Infrastructure as Code (IaC).
- Configuring AWS providers in Terraform.
- Provisioning EC2 instances using Terraform.
- Working with Terraform input and output variables.
- Using Terraform's `file()` function.
- Automating software installation through EC2 User Data.
- Understanding cloud-init and instance initialization.
- Managing project versions using Git and GitHub.

---

**Note:** This project uses an existing AWS Key Pair and Security Group. These resources are not created by Terraform.
