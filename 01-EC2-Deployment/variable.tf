variable "ami" {
    description = "Amazon Linux machine image"
    default = "ami-096ef200a877f36af"
}

variable "instance_type" {
    description = "Instance or Server Type"
    default = "t3.micro"
}

variable "key_name" {
    description = "Key pair to connect to this instance"
    default = "EC2_kp"
}

variable "security_groups" {
    description = "Rules for inbound and outbound traffic"
    default = ["EC2-Security-Group"]
  
}