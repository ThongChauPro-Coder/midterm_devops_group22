#!/bin/bash
# Automates the preparation of the runtime environment on Ubuntu.
# Installs Node.js, PM2, Nginx, and creates required directories.

# Exit immediately if any command fails
set -e

echo "STARTING SERVER ENVIRONMENT SETUP"

# Update system packages
echo "[1/5] Updating system package lists..."
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Nginx
echo "[2/5] Installing Nginx..."
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install Node.js - Installing version 20.x LTS
echo "[3/5] Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 (Process Manager)
echo "[4/5] Installing PM2 globally..."
sudo npm install -g pm2

# Create application directory structure
echo "[5/5] Creating required directories (logs, uploads)..."
PROJECT_DIR="/var/www/app"
sudo mkdir -p ${PROJECT_DIR}/logs
sudo mkdir -p ${PROJECT_DIR}/uploads

# Assign ownership to the current user
sudo chown -R $USER:$USER ${PROJECT_DIR}

echo "========================================"
echo "SETUP COMPLETED SUCCESSFULLY!"
echo "Installed software versions:"
node -v
npm -v
pm2 -v
nginx -v
echo "========================================"