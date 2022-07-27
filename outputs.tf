output "init_master_address" {
  value = proxmox_vm_qemu.init_master.ssh_host
}

output "worker1_address" {
  value = proxmox_vm_qemu.worker1.ssh_host
}

output "worker2_address" {
  value = proxmox_vm_qemu.worker2.ssh_host
}
