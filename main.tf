# add the provider, this code will connect to Hypervisor using libvirt
provider "libvirt" {
  uri = var.libvirt_uri
}

# create tmp pool with local-exec
resource "libvirt_pool" "ubuntu" {
  provisioner "local-exec" {
    command = "mkdir -p /tmp/tmp_pool"
  }
  name = "tmp_pool"
  type = "dir"
  path = "/tmp/tmp_pool"
}

# create image volume
resource "libvirt_volume" "image-qcow2" {
  #count  = "2"
  count  = var.domain_count
  name = format("disk_ubuntu%03d.qcow2",count.index+1)
  pool = libvirt_pool.ubuntu.name
  source = var.img_src
  format = "qcow2"
}

# add cloudinit disk to pool
resource "libvirt_cloudinit_disk" "commoninit" {
  name = var.cloudinit_iso
  pool = libvirt_pool.ubuntu.name
  user_data = data.template_file.user_data.rendered
}

# read the configuration
data "template_file" "user_data" {
  template = file("cloud_init.cfg")
}

# Define KVM domain to create
resource "libvirt_domain" "ubuntu" {
  #count  = "2"
  count  = var.domain_count
  name = format("node_ubuntu%03d", count.index+1)
  memory = var.domain_mem
  vcpu   = var.domain_vcpu

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "default"
    wait_for_lease = var.net_lease
  }

  disk {
    volume_id = libvirt_volume.image-qcow2[count.index].id
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

# type = "none" not supported by the provider
  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
