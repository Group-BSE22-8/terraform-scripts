resource "proxmox_vm_qemu" "srv_demo" {
    # Name of the VM.
    name = "srv-demo"
    # Description of the VM.
    desc = "Ubuntu Server"
    # Template to use for the VM.
    vmid = "300"
    # Target node for the VM.
    target_node = "pve1"

    clone = "ubuntu-cloud"

    # CPU Settings
    cores = 2
    sockets = 1
    cpu = "host"

    # Memory Settings
    memory = 2048

    # Network Settings
    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    # Storage Settings
    disk {
        storage = "zfs-raid-1"
        type = "raw"
        # Must match the size of the disk image
        size = "20G"
    }

    # Cloud Init Settings
    os_type = "cloud_init"
    # ipconfig0 = "ip=10.10.10.10/16,gw=10.10.10.10"
    # nameserver = "10.10.10.10"
    # ciuser = "ubuntu"
    # sshkeys = 
}