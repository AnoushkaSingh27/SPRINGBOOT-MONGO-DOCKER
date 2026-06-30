# Spring Boot Mongo Docker

A Spring Boot application integrated with MongoDB, containerized using Docker and automated with a GitHub Actions CI/CD pipeline.

## Features

- Spring Boot REST API
- MongoDB integration
- Multi-stage Docker build
- Non-root Docker container
- Docker Compose for local development
- GitHub Actions CI/CD
- Automatic Docker image publishing to Docker Hub

## Tech Stack

- Java
- Spring Boot
- Maven
- MongoDB
- Docker
- Docker Compose
- GitHub Actions

## Project Structure

```
.
├── src
├── Dockerfile
├── docker-compose.yml
├── pom.xml
├── README.md
└── .github
    └── workflows
        └── cicd.yml
```

## Running Locally

### Clone the repository

```bash
git clone <repository-url>
cd SPRINGBOOT-MONGO-DOCKER
```

### Build and start

```bash
docker compose up --build
```

The application will be available at:

```
http://localhost:8080
```

MongoDB runs on:

```
localhost:27017
```

## CI/CD Pipeline

The project uses GitHub Actions for Continuous Integration and Continuous Deployment.

### Pull Request

- Checkout repository
- Setup Java
- Build using Maven

### Push to main

- Checkout repository
- Setup Java
- Build using Maven
- Login to Docker Hub
- Build Docker image
- Tag image using Git commit SHA
- Push image to Docker Hub

## Docker Image

Images are automatically published to Docker Hub with tags based on the shortened Git commit SHA.

## Author

Anoushka

## CI/CD pipeline tested