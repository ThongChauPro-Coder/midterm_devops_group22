# Product Management System - DevOps Project

**PROJECT OVERVIEW**    

This project focuses on the deployment, orchestration, and maintenance of an Apple Product Management System. The application is a fully functional web interface that allows users to perform CRUD (Create, Read, Update, Delete) operations on a product inventory, including details such as name, price, color, and descriptions.

The primary goal of this repository is to demonstrate a professional DevOps lifecycle, migrating the application from a traditional host-based execution to a fully containerized architecture on the cloud.

**GITHUB REPOSITORY**

    The official source code and documentation for this project are maintained at:
    Link: https://github.com/ThongChauPro-Coder/midterm_devops_group22

**TECHNOLOGY STACK**

- Backend: Node.js with Express framework for handling product logic and API endpoints.
- Database: MongoDB, used as the primary data source for storing product inventory.
- Infrastructure: Amazon Web Services (AWS) EC2, running Ubuntu 24.04 LTS.
- Web Server: Nginx, serving as a Reverse Proxy and managing SSL/TLS termination.
- Containerization: Docker & Docker Compose for orchestration.
- Security: HTTPS enabled via Let's Encrypt (Certbot) on the domain `www.ngochithuan.com`

**REPOSITORY STRUCTURE**

- `/phase1` — Foundation scripts, Git workflow documentation, and automation tools.
- `/phase2` — Artifacts for traditional host-based deployment (Nginx configs, PM2 setup).
- `/phase3` — Containerization artifacts, including Dockerfiles and docker-compose.yml.
- `/src` — Core application source code.

**LOCAL DEPLOYMENT SETUP**

To reproduce the environment locally:
1. Clone the repository:

```text
git clone https://github.com/ThongChauPro-Coder/midterm_devops_group22.git
cd midterm_devops_group22
```
2. Install dependencies:

```text
npm install
```
3. Environment Configuration:
Creat a `.env` file and define the following variables:
- PORT=3000
- MONGO_URL=mongodb://localhost:27017/products_db
4. Run the application
```bash
npm start
```
**Deployment Phases**

**1. Phase 1: Automation & Workflow**

    Established a professional collaborative model using feature branches and Pull Requests. Developed a `setup.sh` script to automate the installation of Node.js, MongoDB, and Nginx on the Ubuntu host.
**2. Phase 2: Traditional Cloud Deployment**

The system was deployed directly on the EC2 instance.


- **Persistence**: PM2 was used to ensure the application restarts automatically after server reboots.

- **Networking**: Nginx routes traffic from the public domain `www.ngochithuan.com` to the local application port.

**3. Phase 3: Containerized Architecture**

The entire stack is migrated to Docker containers.
- **Web Service**: Pulls the production-ready image thongchau/mid-devops-nodejs:latest from Docker Hub.
- **Database Service**: Runs an official MongoDB container with persistent volumes for data storage.
- **Orchestration**: Managed via docker-compose.yml, ensuring internal service connectivity and automated restart policies.

**PROJECT TEAM**
- **Leader A (Thông - 523H0098)**: Cloud Infrastructure, Docker Hub Management, and Project Oversight.
- **Member B (Nhi - 523H0066)**: Dockerfile Development, Image Building, and Local Integration Testing.
- **Member C (Thuận - 523H0102)**: Docker Compose Orchestration, MongoDB Containerization, and Nginx Maintenance.

