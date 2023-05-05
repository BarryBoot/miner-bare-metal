# Zenotta Bare Metal Miner Provisioner

This repo contains everything you need to create your own iso image for bare metal mining.
Using this you should be able to bring up mining rigs at large scale.

## Requirements

### Install Packer

Documentation to install packer found [here](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)

### Docker

Your machine needs to be able to run docker containers as we use this to build and provision our `.iso` image

## Building the iso

`packer init .`
`packer build miner-iso.pkr.hcl`