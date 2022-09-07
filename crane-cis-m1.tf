resource "proxmox_vm_qemu" "crane_cis_m1" {
    # Name of the VM.
    name = "crane-cis-m1"
    # Description of the VM.
    desc = "Terraform generated vm"
    # Template to use for the VM.
    vmid = "100"
    # Target node for the VM.
    target_node = "pve1"

    clone = "ubuntu-cloud"

    # CPU Settings
    cores = 1
    sockets = 1
    cpu = "host"

    # Memory Settings
    memory = 4096

    # Network Settings
    network {
        bridge = "vmbr0"
        model = "virtio"
        firewall = true
    }

    # Storage Settings
    disk {
        storage = "zfs-raid-1"
        type = "raw"
        # Must match the size of the disk image
        size = "50G"
    }

    # Cloud Init Settings
    os_type = "cloud_init"
    # ipconfig0 = "ip=10.10.10.10/16,gw=10.10.10.10"
    # nameserver = "10.10.10.10"
    # ciuser = "ubuntu"
    # sshkeys = 
}