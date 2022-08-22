resource "proxmox_vm" "srv_demo1" {
    # Name of the VM.
    name = "srv_demo1"
    # Description of the VM.
    desc = "Ubuntu Server"
    # Template to use for the VM.
    vmid = "8000"
    # Target node for the VM.
    target_node = "pve1"

    clone = "ubuntu-server-focal"
    clone_storage = "zfs-raid-1"

    # CPU Settings
    cores = 2
    sockets = 1
    cpu = "host"

    # Memory Settings
    memory = 2048

    # Network Settings
    network {
        brigde = "vmbr0"
        model = "virtio"
    }

    # Storage Settings
    disk {
        storge = "zfs-raid-1"
        type = "zfs"
        # Must match the size of the disk image
        size = "20G"
    }

    # Cloud Init Settings
    os_type = "cloud_init"

}