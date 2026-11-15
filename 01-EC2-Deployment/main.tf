resource "aws_instance" "Linux_VM" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    security_groups =var.security_groups
    user_data = file("${path.module}/httpd.sh")

    tags = {
      Name="Linux-VM-Terraform"
    }
}