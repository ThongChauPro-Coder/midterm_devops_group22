#!/bin/bash
# Automates the preparation of the Ubuntu runtime environment.
# Installs Node.js (v20), PM2, Nginx, Git, Build Tools, and MongoDB.

# Exit immediately if any command fails
set -e

echo "SERVER ENVIRONMENT SETUP INITIATED 🚀"

# Update system packages
echo "[1/7] Updating system package lists..."
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Git and Build Essentials
# Required for cloning the repository and compiling Node.js native addons
echo "[2/7] Installing Git and Build Tools..."
sudo apt-get install -y git build-essential

# Install Nginx
echo "[3/7] Installing Nginx..."
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Install Node.js (v20.x LTS)
echo "[4/7] Installing Node.js v20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2
echo "[5/7] Installing PM2 globally..."
sudo npm install -g pm2

# Install MongoDB 6.0
echo "[6/7] Installing MongoDB 6.0..."
sudo apt-get install -y gnupg curl
# Import public key
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor --yes
# Create list file
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
# Update and install
sudo apt-get update -y
sudo apt-get install -y mongodb-org
# Start and enable MongoDB service
sudo systemctl start mongod
sudo systemctl enable mongod

# Create application directories
echo "[7/7] Creating necessary directories for the application..."
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
mongod --version | head -n 1
echo "==================================================="