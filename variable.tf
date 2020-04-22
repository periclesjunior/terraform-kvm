variable "libvirt_uri" {
  description = "Libvirt Uri for local or remote access"
  type        = string
  default     = "qemu:///system"
}

variable "domain_count" {
  description = "Set number of Libvirt Domains and your Disks"
  type        = string
  default     = "2"
}

variable "img_src" {
  description = "IMG source local or remote"
  type        = string
  default     = "/tmp/bionic-server-cloudimg-amd64.img"
#  If you prefer download img, be patient. ;-)
#  default     = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
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
