variable "ami" {
    description = "AMI id of the aws instance"
    type = string
}

variable "instance_type" {
    description = "Type of EC2 instance"
    type = string
}

variable "server_name" {
    description = "Server name according to the environment"
    type = string
  
}

variable "environment" {
    description = "Working Environment of the EC2 instance"
    type = string
}