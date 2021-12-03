terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = var.pve_url
    pm_user = var.pve_user
    pm_password = var.pve_password
}

locals {
  vm_settings = {
    "gateway"   =   { vmid = "100", size = "8G",  ram = "1024", os = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz" },
    "admin"     =   { vmid = "101", size = "8G",  ram = "1024", os = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz" },
    "cloud"     =   { vmid = "102", size = "8G",  ram = "4096", os = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz" },
    "cam"       =   { vmid = "103", size = "16G", ram = "4096", os = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz" },
    "backup"    =   { vmid = "104", size = "8G",  ram = "1024", os = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz" },
    "web"       =   { vmid = "105", size = "25G",  ram = "4096", os = "local:vztmpl/debian-11-standard_11.0-1_amd64.tar.gz" },
    "drive"    =    { vmid = "106", size = "100G",  ram = "2048", os = "local:vztmpl/alpine-3.12-default_20200823_amd64.tar.xz" }
  }
}


resource "proxmox_lxc" "map" { 
    for_each = local.vm_settings
    
    hostname = each.key
    vmid = each.value.vmid
    cores = 1
    memory = each.value.ram
    swap = "0"
    network {
        name = "eth0"
        bridge = "vmbr1"
        ip = "10.0.1.${each.value.vmid}/24"  
        gw = "10.0.1.1"
        firewall = false
    }
    features {
        keyctl = true
        nesting = true
    }
    rootfs {
      storage = "local-lvm"
      size = each.value.size
    }
    ostemplate = each.value.os
    ssh_public_keys = var.pve_ssh_key
    target_node = "pve01"
    unprivileged = true
    start = true
    onboot = true

    provisioner "file" {
      source      = "bootstrap.sh"
      destination = "/tmp/bootstrap.sh"

      connection {
        type     = "ssh"
        user     = var.pve_host_user
        host     = var.pve_host_name
        port     = var.pve_host_port
      }
    }

    provisioner "remote-exec" {
      inline = [
        "sudo chmod +x /tmp/bootstrap.sh",
        "sudo /tmp/bootstrap.sh ${each.value.vmid} ${each.key} ${var.github_token}",
      ]
      connection {
        type     = "ssh"
        user     = var.pve_host_user
        host     = var.pve_host_name
        port     = var.pve_host_port
      }
    }
}
