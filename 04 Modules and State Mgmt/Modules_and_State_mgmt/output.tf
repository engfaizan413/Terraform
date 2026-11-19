output "dev_instance_id" {
  value = module.dev_server.instance_id
}

output "prod_instance_id" {
  value = module.prod_server.instance_id
}

output "devserver_pubIP" {
  value = module.dev_server.instance_public_ip
}

output "prodserver_pubIP" {
  value = module.prod_server.instance_public_ip
}
