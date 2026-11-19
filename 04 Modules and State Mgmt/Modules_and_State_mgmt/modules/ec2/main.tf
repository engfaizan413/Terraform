resource "aws_instance" "terra-state-instance" {
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    Name = var.server_name
    Environment = var.environment
  }
}