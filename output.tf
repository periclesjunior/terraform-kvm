# Print the IP
# Can use `virsh domifaddr <vm_name> <interface>` to get the ip later
output "ips" {
  # show IP, run 'terraform refresh' if not populated
  #value = libvirt_domain.test.*.network_interface.0.addresses
  value = libvirt_domain.ubuntu.*.network_interface.0.addresses
}
