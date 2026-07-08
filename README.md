# Production-Ready Spring Boot DevOps Pipeline

## Overview

This project demonstrates a production-oriented DevOps pipeline for deploying a Spring Boot application with MongoDB on DigitalOcean. It showcases modern DevOps practices by automating application containerization, continuous integration, infrastructure provisioning, configuration management, and deployment using industry-standard tools.

The project is designed to provision infrastructure, deploy the application, and support a highly available architecture with multiple application instances behind a load balancer.

---

## Tech Stack

- Java 17
- Spring Boot
- MongoDB
- Docker
- Docker Compose
- GitHub Actions
- Terraform
- Ansible
- DigitalOcean

---

## Features

- Production-ready multi-stage Docker build
- Docker Compose based application deployment
- Automated CI/CD pipeline using GitHub Actions
- Docker image build and push to Docker Hub
- Infrastructure provisioning using Terraform
- Automated server configuration with Ansible
- Secure environment variable based application configuration
- Managed MongoDB integration
- High availability deployment using multiple application instances
- DigitalOcean Load Balancer configuration
- Spring Boot Actuator health endpoint
- Infrastructure outputs for deployment resources

---

## Project Architecture

```text
                 Developer
                     │
                     ▼
                  GitHub
                     │
                     ▼
             GitHub Actions
              │            │
              ▼            ▼
        Terraform      Ansible
              │            │
              │            ├── Install Docker
              │            ├── Configure Environment
              │            ├── Deploy Application
              │            └── Run Docker Compose
              │
              ▼
        Load Balancer
              │
      ┌───────┴────────┐
      ▼                ▼
 Application      Application
  Droplet 1        Droplet 2
      │                │
      └──────┬─────────┘
             ▼
      Managed MongoDB
```

---

## Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── cicd.yml
├── ansible/
│   ├── deploy.yml
│   └── inventory.ini
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── .terraform.lock.hcl
├── src/
├── Dockerfile
├── docker-compose.yml
├── pom.xml
└── README.md
```

---

## CI/CD Workflow

1. Developer pushes code to GitHub.
2. GitHub Actions builds the Spring Boot application.
3. A Docker image is built and pushed to Docker Hub.
4. Terraform provisions or updates the required infrastructure.
5. Ansible configures the application servers and deploys the latest container.
6. The application instances are served through the DigitalOcean Load Balancer.

---

## Infrastructure Components

- **Application Servers:** Two DigitalOcean Droplets running the Spring Boot application.
- **Database:** DigitalOcean Managed MongoDB.
- **Load Balancer:** Distributes incoming traffic across application instances.
- **Configuration Management:** Ansible automates server setup and deployment.
- **Infrastructure as Code:** Terraform provisions and manages cloud resources.
- **CI/CD:** GitHub Actions automates build and deployment workflows.

---

## Getting Started

### Clone the repository

```bash
git clone https://github.com/AnoushkaSingh27/SPRINGBOOT-MONGO-DOCKER.git
cd SPRINGBOOT-MONGO-DOCKER
```

### Build the Docker image

```bash
docker build -t springboot-mongo-docker .
```

### Run locally

```bash
docker compose up
```

---

## Future Enhancements

The following production features can be added to further enhance the deployment:

- Domain name integration
- SSL/TLS termination
- Firewall hardening
- Prometheus monitoring
- Grafana dashboards
- Centralized logging

---

## Author

**Anoushka Singh**