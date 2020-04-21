variable "libvirt_uri" {
  description = "Libvirt Uri for local or remote access"
  type        = string
  default     = "qemu:///system"
}

variable "disk_name" {
  description = "VM disk name"
  type        = string
  default     = "ubuntu18.04.qcow2"
}

variable "img_src" {
  description = "IMG source local or remote"
  type        = string
  default     = "/tmp/bionic-server-cloudimg-amd64.img"
}

variable "cloudinit_iso" {
  description = "Cloudinit ISO name"
  type        = string
  default     = "commoninit.iso"
}

variable "domain_mem" {
  description = "Libvirt Domain memory"
  type        = string
  default     = "2048"
}

variable "domain_vcpu" {
  description = "Libvirt Domain VCPU"
  type        = string
  default     = "1"
}

variable "net_lease" {
  description = "Enable or disable wait lease time"
  type        = bool 
  default     = true
}
