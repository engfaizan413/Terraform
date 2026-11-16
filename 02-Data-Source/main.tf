data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023.12.20261112.0-kernel-6.18-x86_64"]
  }

}

resource "aws_security_group" "EC2-SG" {
  name        = "EC2-sg"
  description = "Allow SSH, HTTP and HTTPs Traffic"

  ingress {
    description = "Allow SSH"
    to_port     = 22
    from_port   = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }



}

resource "aws_instance" "amazon-linux" {
  ami                    = data.aws_ami.amazon-linux.id
  vpc_security_group_ids = [aws_security_group.EC2-SG.id]
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = file("${path.module}/user_data.sh")

  tags = {
    Name = "Amazon Linux Machine"
  }

}