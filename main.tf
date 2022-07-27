terraform {
  backend "s3" {
    bucket = "terraformstatephilipbrooks"
    region = "us-east-1"
    key    = "proxmox/terraform.tfstate"
    access_key = "<access_key>"
    secret_key = "<secret_key>"
  }
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://pve3.proxmox.lol:8006/api2/json"
  pm_user    = "root@pam"
}



resource "proxmox_vm_qemu" "init_master" {
  name        = "RancherLOL"
  desc        = "RancherLOL Server"
  target_node = "pve3"
  onboot      = "true"
  full_clone  = "true"
  clone       = "CentosBase"
  cores       = 4
  sockets     = 1
  memory      = 4096
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "philip"
  sshkeys     = "<pub_key>"


  disk {
    type    = "scsi"
    storage = "NVMPOOL"
    size    = "32G"
  }
  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}

resource "proxmox_vm_qemu" "worker1" {
  name        = "RancherLOLworker1"
  desc        = "RancherLOL Server Worker1"
  target_node = "pve3"
  onboot      = "true"
  full_clone  = "true"
  clone       = "CentosBase"
  cores       = 4
  sockets     = 1
  memory      = 4096
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "philip"
  sshkeys     = "<pub_key>"


  disk {
    type    = "scsi"
    storage = "NVMPOOL"
    size    = "32G"
  }
  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}

resource "proxmox_vm_qemu" "worker2" {
  name        = "RancherLOLWorker2"
  desc        = "RancherLOL Worker2"
  target_node = "pve3"
  onboot      = "true"
  full_clone  = "true"
  clone       = "CentosBase"
  cores       = 4
  sockets     = 1
  memory      = 4096
  agent       = 1
  ipconfig0   = "ip=dhcp"
  ciuser      = "philip"
  sshkeys     = "<pub_key>"


  disk {
    type    = "scsi"
    storage = "NVMPOOL"
    size    = "32G"
  }
  # Set the network
  network {
    model  = "virtio"
    bridge = "vmbr1"
  }

}
