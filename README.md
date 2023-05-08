# Zenotta Bare Metal Miner Provisioner

## Overview

This repo contains everything you need to create your own iso image for bare metal mining.

Using this you should be able to bring up mining rigs at large scale.

> This image is specifically build to cater for mining rigs with multiple cards but may be used for single card setups too.
> To make this possible we use containers that each get their own NVidia device 
> These containers are managed using podman

We use docker to build an image that will run a miner node in a distroless container.

Once the image is in place we use Packer to build an .iso image that is ready to run one your bare-metal machine.

This image has:

1. debian bullseye slim
2. podman for running production containers as non-root and daemonless
3. NVidia drivers and NVidia container toolkit
4. each container has its own NVidia card

## Usage 

All artifacts are built using gitlab actions.

* `ghcr.io/barryboot/miner-bare-metal:main` is available if you just want the mining node container
* specify iso location once we know where that will live