variable "project_name" {
  type        = string
  description = "Project name used in tags and resource names (lowercase, no spaces)"
  default     = "dynamic-aws-infra"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, prod."
  }
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create"
  default     = 1

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 5
    error_message = "Instance count must be between 1 and 5."
  }
}

variable "instance_types" {
  type        = map(string)
  description = "EC2 instance type per environment"
  default = {
    dev     = "t2.micro"
    staging = "t2.small"
    prod    = "t2.medium"
  }
}

variable "inbound_rules" {
  type = list(object({
    port        = number
    protocol    = string
    description = string
    cidr_blocks = list(string)
  }))
  description = "Ingress rules for the security group"
  default = [
    {
      port        = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = ["119.154.29.59"]
    },
    {
      port        = 80
      protocol    = "tcp"
      description = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 443
      protocol    = "tcp"
      description = "HTTPS"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "bucket_names" {
  type        = map(string)
  description = "S3 bucket identifiers (key => purpose)"
  default = {
    logs    = "logs"
    backups = "backups"
    assets  = "assets"
  }
}

variable "admin_password" {
  type        = string
  description = "Admin password"
  sensitive   = true

  validation {
    condition     = length(var.admin_password) >= 8
    error_message = "Admin password must be at least 8 characters long."
  }
}
