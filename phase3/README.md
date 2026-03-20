# Phase 3: Modern Containerization and Orchestration

1. **OBJECTIVES**

    The core objective of Phase 3 is to migrate the Apple Product Management System from a traditional host-based deployment to a fully containerized architecture. This phase focuses on:

    - **Infrastructure as Code**: Defining the entire application stack and its dependencies using Docker Compose.
    - **Deployment Reproducibility**: Leveraging a container registry (Docker Hub) to ensure consistent deployments across environments.
    - **Operational Resilience**: Implementing automated restart policies and persistent storage for data integrity.

2. **CONTAINERIZATION STRATEGY**
    Every component of the system has been packaged into isolated, production-ready Docker containers:

    - **Web Application**: A custom Dockerfile was developed to build the Node.js environment. The resulting image is pushed to Docker Hub (`thongchau/mid-devops-nodejs:latest`).
    - **Database**: An official MongoDB image is used to ensure reliability and industry-standard security.
    - **Workflow**: During deployment, Docker Compose pulls the pre-built image from the registry rather than building from local source, reinforcing a professional CI/CD-oriented workflow.

3. **ORCHESTRATION WITH DOCKER COMPOSE**

    The system is orchestrated using a docker-compose.yml file, which defines the service topology:

    - **Networking**: Services communicate through a dedicated internal bridge network (`app-network`), allowing the web app to reach the database via its service name (`mongodb`).
    - **Persistent Volumes**: 
        - `mongo_data`: Mapped to `/data/db` to preserve product data across container restarts.
        - `uploads_data`: (If applicable) Mapped to ensure user-uploaded product images remain persistent.
    
    - **Restart Policies**: All services are configured with `restart: always` to ensure high availability after unexpected crashes or server reboots.

4. **REVERSE PROXY INTEGRATION**

    The **Nginx** instance configured on the host in Phase 2 remains the public entry point.

    - **Update**: The upstream target within the Nginx configuration was modified to redirect traffic to the containerized web service instead of the host-executed process.
    - **SSL Status**: Secure HTTPS access via the domain `www.ngochithuan.com` continues to operate correctly in this containerized setup.

5. **REPOSITORY ARTIFACTS**

    This directory contains the essential configurations for the containerized environment:

    - `Dockerfile`: Defines the build process for the Node.js web application.
    - `docker-compose.yml`: The orchestration file for the multi-container stack.
    