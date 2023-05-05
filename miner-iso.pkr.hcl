packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "ansible_host" {
  default = "default"
}

variable "ansible_connection" {
  default = "docker"
}

variable "ansible_user" {
  default = "root"
}

source "docker" "debian" {
  image  = "debian:bullseye"
  commit = true
  run_command = [ "-d", "-i", "-t", "--name", var.ansible_host, "{{.Image}}", "/bin/bash" ]
}

build {
  name = "zenotta-miner"
  sources = [
    "source.docker.debian"
  ]
  provisioner "shell" {
    inline = ["apt-get update && apt-get install python3 curl ca-certificates gnupg -y"]
  }
  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yml"
    extra_arguments = [
      "--extra-vars",
      "ansible_host=${var.ansible_host} ansible_connection=${var.ansible_connection} ansible_user=${var.ansible_user}"
    ]
  }
}

