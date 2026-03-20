# Phase 2: Traditional Cloud Deployment and Security

1. **OBJECTIVES**
    The core objective of Phase 2 is to deploy the Apple Product Management System directly onto a cloud-based Ubuntu host. This phase focuses on:  

    - **Host-level Administration**: Configuring the runtime environment natively on the OS.
    - **Network Security**: Implementing firewall rules and securing administrative access.
    - **Web Delivery**: Setting up a reverse proxy, custom domain, and SSL/TLS encryption.

2. **INFRASTRUCTURE PROVISIONING**

    - **Cloud Provider**: Amazon Web Services (AWS) EC2.
    - **Operating System**: Ubuntu 24.04 LTS.
    - **Security Configuration**: The system follows the principle of least privilege, opening only essential ports: 22 (SSH), 80 (HTTP), and 443 (HTTPS).

        - Firewall rules are managed via AWS Security Groups and UFW.

3. **ENVIRONMENT PREPARATION**

    The server environment was prepared using the automation script developed in Phase 1.

    - **Runtime**: Node.js and npm were installed natively to execute the application backend.
    - **Database**: MongoDB was installed and configured directly on the host OS to store product inventory data.
    - **Persistence**: The application is managed by PM2, ensuring it automatically restarts in the event of a server reboot or unexpected failure.

4. **NETWORKING & HTTPS**

    A professional web delivery stack was implemented to ensure secure public access:

    - **Reverse Proxy**: Nginx was configured at the host level to route traffic from port 80/443 to the Node.js application running on port 3000.
    - **Domain Management**: The domain `www.ngochithuan.com` was pointed to the server's public IP address via A-records.
    - **SSL/TLS Encryption**: A valid certificate from Let's Encrypt was installed using **Certbot**, providing end-to-end encryption for users.

5. **REPOSITORY ARTIFACTS**

    This directory contains all relevant configurations for the traditional deployment:

    - `nginx.conf`: The Nginx configuration file defining proxy rules and SSL paths.
    - `/evidence`: Documentation of the operational state, including:

        - DNS configuration and HTTPS status.
        - Evidence of database connectivity and file upload functionality.
        - PM2 process status showing automatic restart capability.