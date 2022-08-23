terraform {
    required_version = ">= 1.2.6"

    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "2.9.11"

            # Optional Logging functionality, to enable uncomment the lines below.

            # pm_log_enable = true
            # pm_log_file   = "terraform-plugin-proxmox.log"
            # pm_debug      = true
            # pm_log_levels = {
            #     _default    = "debug"
            #     _capturelog = ""
            # }
        }
    }
}

variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

provider "proxmox" {
    pm_api_url = "${var.proxmox_api_url}"
    pm_api_token_id = "${var.proxmox_api_token_id}"
    pm_api_token_secret = "${var.proxmox_api_token_secret}"
    
    pm_tls_insecure = true
}