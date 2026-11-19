output "instance_id" {
    description = "ID of created instance"
    value = aws_instance.terra-state-instance.id
}

output "instance_public_ip" {
    description = "Public IP of the EC2 instance"
    value = aws_instance.terra-state-instance.public_ip
}