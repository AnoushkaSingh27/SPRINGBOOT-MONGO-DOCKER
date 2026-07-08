variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
}
variable "region" {
  description = "DigitalOcean region where the Droplet will be created"
  type        = string
}
variable "droplet_name" {
  description = "Name of the DigitalOcean Droplet"
  type        = string
}
variable "droplet_size" {
  description = "size of droplet"
  type        = string
}
variable "ssh_fingerprint" {
  description = "Fingerprint of the SSH key in DigitalOcean"
  type        = string
}
variable "database_cluster_name" {
  description = "Name of the MongoDB cluster"
  type        = string
}

variable "database_version" {
  description = "MongoDB version"
  type        = string
}

variable "database_size" {
  description = "Size of each database node"
  type        = string
}

variable "database_node_count" {
  description = "Number of nodes in the MongoDB cluster"
  type        = number
}