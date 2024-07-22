#!/bin/bash

# Fetch and add Tailscale GPG key to keyring
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null

# Add Tailscale repository to package sources
curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

# Update package lists
sudo apt-get update

# Install Tailscale package
sudo apt-get install tailscale -y

# Initialize Tailscale with your account
sudo tailscale up

# Display Tailscale IPv4 address
tailscale ip -4
