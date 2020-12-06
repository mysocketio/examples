# Create a server
variable "DO_TOKEN" {}
provider "digitalocean" {
  token = var.DO_TOKEN
}

#NYC region
resource "digitalocean_droplet" "nyc1" {
    name = "${format("compute-%03d", count.index)}-nyc1"
    region = "nyc1"
    count = 2
    image  = "ubuntu-20-04-x64"
    size   = "s-2vcpu-4gb"
    user_data = file("cloudinit.yml")
}

#TOR1 region
resource "digitalocean_droplet" "tor1" {
    name = "${format("compute-%03d", count.index)}-tor1"
    region = "tor1"
    count = 2
    image  = "ubuntu-20-04-x64"
    size   = "s-2vcpu-4gb"
    user_data = file("cloudinit.yml")
}
#Print the IP addresses of the newly create Vms
output "Toronto_droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.tor1:
    droplet.name => droplet.ipv4_address
  }
}
output "NewYork_droplet_ip_addresses" {
  value = {
    for droplet in digitalocean_droplet.nyc1:
    droplet.name => droplet.ipv4_address
  }
}
