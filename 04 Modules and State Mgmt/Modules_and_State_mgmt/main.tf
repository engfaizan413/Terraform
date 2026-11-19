module "dev_server" {
    source = "./modules/ec2"

    ami = var.ami
    instance_type = "t3.micro"
    server_name = "Dev_Server"
    environment = "dev"
}

module "prod_server" {
    source = "./modules/ec2"

    ami = var.ami
    instance_type = "t3.micro"
    server_name = "Prod_server"
    environment = "Prod"
}