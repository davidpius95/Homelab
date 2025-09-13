resource "proxmox_vm_qemu" "production" {
    vmid = 104
    name = "production"
    target_node = "guildserver"
    clone = "UbuntuTemplet"
    full_clone = false
    bios = "ovmf"
    agent = 1
    scsihw = "virtio-scsi-single"

    os_type = "ubuntu"
    cpu {
        type = "host"
        cores = 2
        sockets = 1
    }
    memory = 2048

    disks {
        scsi {
            scsi0 {
                disk {
                    size = "50G"
                    storage = "local"
                    format = "qcow2"
                }
            }
        }
    }
}