# Dynamic AWS Infrastructure Configuration

## Project Overview

This project demonstrates how to use Terraform to provision and manage AWS infrastructure dynamically across different environments, including Development, Staging, and Production.

The infrastructure configuration uses Terraform variables, local values, conditional expressions, meta-arguments, and dynamic blocks to create reusable and flexible infrastructure without repeating resource configurations.

## Technologies Used

- Terraform
- AWS
- Amazon EC2
- AWS Security Groups
- Amazon EBS
- HCL (HashiCorp Configuration Language)

## Terraform Concepts Implemented

This project covers the following Terraform concepts:

- **Variables:** Declaring input variables with default values and different data types.
- **Interactive Input & tfvars:** Passing configuration values through terminal input and `.tfvars` files.
- **Variable Validation:** Applying validation rules to restrict invalid input values.
- **Sensitive Variables:** Protecting sensitive information such as passwords.
- **Local Values:** Defining reusable expressions and common configurations.
- **Conditional Expressions:** Dynamically selecting configurations based on the deployment environment.
- **Count Meta-Argument:** Creating multiple EC2 instances based on the specified instance count.
- **For_each Meta-Argument:** Creating multiple resources using maps or sets.
- **Dynamic Blocks:** Generating multiple security group ingress rules from variable-defined configurations.

## Infrastructure Configuration

The project is designed to support three deployment environments:

| Configuration | Development | Staging | Production |
|---|---|---|---|
| Instance Type | t2.micro | t2.small | t2.medium |
| EC2 Instances | 1 | 2 | 3 |
| EBS Volume | 8 GB | 15 GB | 30 GB |
| Monitoring | Disabled | Enabled | Enabled |
| Public IP | Enabled | Disabled | Disabled |

The environment-specific configuration is managed through Terraform variables, local values, and conditional expressions.

## AWS Resources

### 1. Amazon EC2

- Deploys multiple EC2 instances using the `count` meta-argument.
- Retrieves the latest matching Amazon Linux 2023 AMI using a Terraform data source.
- Dynamically selects instance types based on the environment.
- Configures EBS root volume size according to the selected environment.
- Applies environment-specific configurations.

### 2. AWS Security Group

- Creates security group ingress rules using dynamic blocks.
- Supports multiple inbound rules through variable-defined configurations.
- Allows individual port, protocol, description, and CIDR configurations for each rule.

### 3. Amazon S3

Planned implementation using the `for_each` meta-argument to create multiple S3 buckets with environment-specific naming.

## Project Structure

```text
terraform-dynamic-infrastructure/
│
├── main.tf
├── variables.tf
├── locals.tf
├── terraform.tfvars
├── outputs.tf
├── .gitignore
└── README.md
```

## Deployment Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd terraform-dynamic-infrastructure
```

### 2. Configure AWS Credentials

Configure your AWS credentials using an appropriate authentication method, such as AWS CLI.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Format Configuration Files

```bash
terraform fmt
```

### 5. Validate Configuration

```bash
terraform validate
```

### 6. Review Execution Plan

```bash
terraform plan
```

### 7. Deploy Infrastructure

```bash
terraform apply
```

### 8. Destroy Infrastructure

After completing the deployment and testing:

```bash
terraform destroy
```

## Key Learning Outcomes

Through this project, I gained practical experience in:

- Writing reusable Terraform configurations.
- Managing environment-specific infrastructure.
- Using variables and local values to reduce hardcoded configurations.
- Creating multiple AWS resources using Terraform meta-arguments.
- Generating nested resource blocks dynamically.
- Applying input validation and handling sensitive variables.
- Managing infrastructure through Terraform execution plans.

## Author

**Faizan Afzal**

GitHub: [Your GitHub Profile](https://github.com/)

