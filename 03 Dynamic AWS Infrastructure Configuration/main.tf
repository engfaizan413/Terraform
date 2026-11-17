data "aws_ami" "amazon-linux-machine" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "aws_security_group" "ec2-sg" {
  name_prefix = "${var.project_name}-${var.environment}-sg-"
  description = "Security group for ${var.environment} web instances"

  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${var.environment}-sg"
  })
}

resource "aws_instance" "web-app" {
  count                       = var.instance_count
  ami                         = data.aws_ami.amazon-linux-machine.id
  instance_type               = local.instance_type
  monitoring                  = local.enable_monitoring
  associate_public_ip_address = local.assign_public_ip
  vpc_security_group_ids      = [aws_security_group.ec2-sg.id]

  root_block_device {
    volume_size = local.vol_size
  }

  tags = merge(local.common_tags, {
    Name = "web-app-${var.environment}-${count.index + 1}"
  })
}

resource "aws_s3_bucket" "buckets" {
  for_each = var.bucket_names
  bucket   = "${var.project_name}-${each.value}-${var.environment}"

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-${each.value}-${var.environment}"
  })
}
