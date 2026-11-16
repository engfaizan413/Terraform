output "ami_id" {
  description = "Get AMI ID of this machine"
  value       = data.aws_ami.amazon-linux.id
}

output "ami_name" {
  description = "Name of AMI"
  value       = data.aws_ami.amazon-linux.name
}

output "instance_id" {
  description = "ID of EC2 Instance"
  value       = aws_instance.amazon-linux.id
}

output "public_ip" {
  description = "Public ip of EC2 Instance"
  value       = aws_instance.amazon-linux.public_ip
}

output "aws_security_group" {
  description = "Name of Security group"
  value       = aws_security_group.EC2-SG.name
}