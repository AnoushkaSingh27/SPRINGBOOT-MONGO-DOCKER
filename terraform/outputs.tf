output "mongodb_host" {
  value = digitalocean_database_cluster.mongodb.host
}

output "mongodb_port" {
  value = digitalocean_database_cluster.mongodb.port
}

output "mongodb_uri" {
  value     = digitalocean_database_cluster.mongodb.uri
  sensitive = true
}
output "droplet_1_ip" {
  value = digitalocean_droplet.springboot_server.ipv4_address
}

output "droplet_2_ip" {
  value = digitalocean_droplet.springboot_server_2.ipv4_address
}

output "load_balancer_ip" {
  value = digitalocean_loadbalancer.springboot_lb.ip
}