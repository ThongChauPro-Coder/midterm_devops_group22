#!/bin/bash
# Automates the preparation of the Ubuntu runtime environment.
# Installs Node.js (v20), PM2, Nginx, Git, and Build Tools.

# Exit immediately if any command fails
set -e

echo "SERVER ENVIRONMENT SETUP INITIATED 🚀"

# Update system packages
echo "[1/6] Updating system package lists..."
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Git and Build Essentials
echo "[2/6] Installing Git and Build Tools..."
sudo apt-get install -y git build-essential

# Install Nginx
echo "[3/6] Installing Nginx..."
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install Node.js (v20.x LTS)
echo "[4/6] Installing Node.js v20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2
echo "[5/6] Installing PM2 globally..."
sudo npm install -g pm2

# Create application directories
echo "[6/6] Creating necessary directories for the application..."
PROJECT_DIR="/var/www/app"
sudo mkdir -p ${PROJECT_DIR}/logs
sudo mkdir -p ${PROJECT_DIR}/uploads
sudo chown -R $USER:$USER ${PROJECT_DIR}

echo "==================================================="
echo "SETUP COMPLETED SUCCESSFULLY!"
echo "Installed Software Versions:"
node -v
npm -v
pm2 -v
nginx -v
git --version
echo "==================================================="