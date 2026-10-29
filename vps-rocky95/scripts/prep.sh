#!/bin/bash
sudo dnf check-update
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl status docker
sudo systemctl enable docker

# Setup permissions
sudo usermod -aG docker $(whoami)
sudo setfacl --modify user:$(whoami):rw /var/run/docker.sock