terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "digitalocean" {
  token = var.do_token
}
resource "digitalocean_droplet" "springboot_server" {
  image    = "ubuntu-24-04-x64"
  name     = var.droplet_name
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [var.ssh_fingerprint]
}
resource "digitalocean_droplet" "springboot_server_2" {
  image    = "ubuntu-24-04-x64"
  name     = "${var.droplet_name}-2"
  region   = var.region
  size     = var.droplet_size
  ssh_keys = [var.ssh_fingerprint]
}
resource "digitalocean_firewall" "springboot_firewall" {
  name = "springboot-firewall"

  droplet_ids = [
    digitalocean_droplet.springboot_server.id
    digitalocean_droplet.springboot_server_2.id
  ]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0"]
  }
  inbound_rule {
  protocol         = "tcp"
  port_range       = "8080"
  source_addresses = ["0.0.0.0/0"]
  }
}
resource "digitalocean_database_cluster" "mongodb" {
  name       = var.database_cluster_name
  engine     = "mongodb"
  version    = var.database_version
  region     = var.region
  size       = var.database_size
  node_count = var.database_node_count
}
resource "digitalocean_loadbalancer" "springboot_lb" {
  name   = "springboot-lb"
  region = var.region

  droplet_ids = [
    digitalocean_droplet.springboot_server.id,
    digitalocean_droplet.springboot_server_2.id
  ]
  forwarding_rule {
  entry_protocol  = "http"
  entry_port      = 80

  target_protocol = "http"
  target_port     = 8080
  }
  healthcheck {
  protocol = "http"
  port     = 8080
  path     = "/actuator/health"

  check_interval_seconds   = 10
  response_timeout_seconds = 5

  healthy_threshold   = 2
  unhealthy_threshold = 2
  }

}