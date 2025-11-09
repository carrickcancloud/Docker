# Docker Compose Web Stack: Apache & Samba

This project demonstrates a multi-container web stack orchestrated with Docker Compose. It consists of two main services: an **Apache** web server and a **Samba** file server, which share a persistent data volume.

The architecture is designed to decouple the web-serving and file-management layers. The Apache container serves web pages, while the Samba container provides a network-accessible share to manage the website's content, such as images and other assets. This setup is ideal for development environments where you need to easily add or modify web content without rebuilding containers.

Most of my work is done through the command line interface (CLI) using terminal commands. I use Visual Studio Code (VSCode) for editing files and managing the project.

- **Services:**
  - `web`: A hardened Apache web server running on Ubuntu 24.04. It dynamically generates its own `index.html` and `error.html` pages on startup.
  - `samba`: A secure Samba server (SMB3, encryption required) providing file-level access to the web root.

- **Key Features:**
  - **Docker Compose:** Defines and runs the multi-container application.
  - **Multi-Stage Dockerfile:** Creates optimized, separate images for each service from a common base.
  - **Named Volumes:** Ensures persistent storage for web content and Samba state, independent of container lifecycles.
  - **Custom Networks:** Isolates traffic between services for enhanced security.
  - **Environment-based Configuration:** Uses a `.env` file for secure credential management.

- **Languages & Tools:**
  - 🐚 Bash (Inline Shell Scripts)
  - 📄 YAML
  - 🐳 Docker
  - 🏗️ Docker Compose
  - 🌐 Apache HTTP Server
  - 📁 Samba (SMB)

---

## Table of Contents

- [Docker Compose Web Stack: Apache \& Samba](#docker-compose-web-stack-apache--samba)
  - [Table of Contents](#table-of-contents)
  - [✅ Requirements](#-requirements)
  - [🐳 Docker Account](#-docker-account)
    - [👤 Create Docker Account](#-create-docker-account)
    - [🖥️ Install Docker Desktop](#️-install-docker-desktop)
  - [🗃️ Git Repository](#️-git-repository)
    - [📦 Download](#-download)
  - [📁 Project Structure](#-project-structure)
  - [🚀 Getting Started](#-getting-started)
    - [1. Environment Configuration](#1-environment-configuration)
    - [2. Build the Images](#2-build-the-images)
    - [Managing the Stack](#managing-the-stack)
  - [⚙️ Managing the Stack](#️-managing-the-stack)
    - [Accessing Services and Conclusion](#accessing-services-and-conclusion)
  - [🌍 Accessing Services](#-accessing-services)
    - [Apache Web Server](#apache-web-server)
    - [Samba File Share](#samba-file-share)
  - [🏁 Conclusion](#-conclusion)

## ✅ Requirements

1. Docker Account
2. Docker Desktop
3. Git (Optional if you prefer to clone or fork the repository.)

## 🐳 Docker Account

### 👤 Create Docker Account

To set up Docker account follow these steps:

1. **Docker Account**: Create one at [Docker](https://app.docker.com/signup)
2. **Verify your account**: Go to your email and look for an email from Docker

### 🖥️ Install Docker Desktop

1. Download: Docker Desktop is available for Windows, macOS, and Linux. You can download it from the official Docker website: [Docker Desktop](https://www.docker.com/products/docker-desktop)
2. Install: Follow the installation instructions for your operating system
3. Start Docker Desktop: After installation, launch Docker Desktop to start the Docker daemon
4. Verify Installation: Open a terminal and run the command `docker --version` to verify that Docker is installed correctly.

   ```bash
   docker --version
   ```

   Output:

   ```angular2html
   ❯ docker --version
   Docker version 28.3.2, build 578ccf6
   ```

## 🗃️ Git Repository

### 📦 Download

1. Zip File: [**Download `ubuntu-apache-compose` Project (Zip)**](https://downgit.github.io/#/home?url=https://github.com/carrickcancloud/Docker/tree/main/ubuntu-apache-compose)
   1. Extract the zip file to a directory of your choice

## 📁 Project Structure

The project is organized into distinct directories for configuration, scripts, and build context.

```plaintext
.
├── apache
│   ├── conf
│   │   ├── apache.conf
│   │   └── security.conf
│   └── images
│       ├── apache.png
│       ├── docker.svg
│       ├── samba.png
│       └── ubuntu.png
├── shell
│   ├── apache_start.sh
│   └── samba_start.sh
├── compose.yaml
├── Dockerfile
└── README.md
```

---

## 🚀 Getting Started

Follow these steps to build and run the entire web stack.

### 1. Environment Configuration

This project requires a password for the Samba user, which is managed via an environment variable.

Create a file named `.env` in the root of the project and add the following line, replacing `<your-secure-password>` with a strong password.

### 2. Build the Images

With Docker Compose, you can build both the `web` and `samba` images defined in the `Dockerfile` with a single command.

```bash
docker compose up --build -d
```

---

### Managing the Stack

## ⚙️ Managing the Stack

Here are the essential commands for managing the application stack.

```bash

# Build all images
docker compose build

# Build web image only
docker compose build web

# Build samba image only
docker compose build samba

# Check the status of all containers
docker compose ps

# View real-time logs for all services
docker compose logs -f

# View real-time logs for the web service only
docker compose logs -f web

# View real-time logs for the samba service only
docker compose logs -f samba

# Open a bash shell inside the 'web' container
docker compose exec web bash

# Open a bash shell inside the 'samba' container
docker compose exec samba bash

# Restart all services in the stack
docker compose restart

# Restart a single service
docker compose restart web
docker compose restart samba

# Stop and remove containers and networks
docker compose down

# WARNING: This will remove persistent data!
# Stop and remove containers, networks, AND volumes.
docker compose down --volumes
```

---

### Accessing Services and Conclusion

## 🌍 Accessing Services

### Apache Web Server

Once the `web` container is running, you can access the website by navigating to the following URL in your browser:

- **URL**: `http://localhost:8080`

This will display the custom `index.html` page generated by the `apache_start.sh` script inside the container.

### Samba File Share

The `samba` container exposes the shared `wwwdata` volume as a network share. You can connect to it using any SMB client to manage the `images` directory.

- **Server/Path**: `smb://<your-host-ip>/wwwhtml`
- **Username**: `wwwuser`
- **Password**: The `SMB_PASSWORD` you set in the `.env` file.

*Note: `<your-host-ip>` is the IP address of the machine running Docker.*

## 🏁 Conclusion

This project serves as a robust template for a modern, containerized web application. It effectively separates concerns by using dedicated containers for serving web traffic and managing files, all while orchestrated cleanly by Docker Compose. This architecture provides persistence, security, and ease of management, reflecting best practices in DevOps and containerization.
