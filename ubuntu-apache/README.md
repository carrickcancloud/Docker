# 🐳 Docker

Welcome to my Docker repository!

This repository focuses on containerization and deployment strategies tailored for DevOps engineering as I expand my knowledge and experience in this field.

Docker Services:

- Docker Desktop
- Docker Hub (Container Registry)

Languages:

- 🐚 Bash (Inline Shell Scripts)
- 📄 YAML

## Table of Contents

- [🐳 Docker](#-docker)
  - [Table of Contents](#table-of-contents)
  - [✅ Requirements](#-requirements)
  - [🐳 Docker Account](#-docker-account)
    - [👤 Create Docker Account](#-create-docker-account)
    - [🔑 Create Docker Personal Access Token (PAT)](#-create-docker-personal-access-token-pat)
    - [🗂️ Create Docker Repository](#️-create-docker-repository)
    - [🖥️ Install Docker Desktop](#️-install-docker-desktop)
  - [🗃️ Git Repository](#️-git-repository)
    - [📋 Clone or Download](#-clone-or-download)
    - [📁 Repository Structure](#-repository-structure)
  - [✨ Docker Magic](#-docker-magic)
    - [📝 Placeholders](#-placeholders)
    - [🔨 Build Docker Image](#-build-docker-image)
    - [🔐 Login to Docker Hub - CLI](#-login-to-docker-hub---cli)
    - [📤 Push the image to Docker Hub](#-push-the-image-to-docker-hub)
    - [🗑️ Delete Local Image](#️-delete-local-image)
    - [📥 Download Image From Docker Hub](#-download-image-from-docker-hub)
    - [🚀 Launch Docker Container](#-launch-docker-container)
    - [🌐 Create Docker Network](#-create-docker-network)
    - [🚀 Launch Docker Container on Web-Network](#-launch-docker-container-on-web-network)
    - [🌍 Access the Web Application](#-access-the-web-application)
    - [📄 Review Apache Logs](#-review-apache-logs)
  - [🏁 Conclusion](#-conclusion)

## ✅ Requirements

1. Docker Account
2. Docker Desktop
3. Git (Optional)

## 🐳 Docker Account

### 👤 Create Docker Account

To set up Docker account follow these steps:

1. **Docker Account**: Create one at [Docker](https://app.docker.com/signup)
2. **Verify your account**: Go to your email and look for an email from Docker

### 🔑 Create Docker Personal Access Token (PAT)

In order to use Docker Hub as repository for our container images, it'll be best to generate a personal access token to authenticate with.

1. Login into Docker Hub: [DockerHub](https://app.docker.com/)
2. Left hand navigation click on "Settings"
3. Click on "Personal access tokens"
4. Click on the "Generate new token" button
   1. Access token description: *Define this how you like*
   2. Expiration Date: *Define this how you like*
   3. Access Permissions: *Read, Write, Delete*
5. Click on the "Generate" button
6. Securely store your *PAT*

### 🗂️ Create Docker Repository

You can create this on your first push or if you want to enable and configure more options, you can create the repository first.
Free accounts have limitations on private repositories and using scout, so please review and have fun at your leisure.

1. Login into Docker Hub: [DockerHub](https://app.docker.com/)
2. Left hand navigation click on "Hub"
3. Click on "Repositories"
4. In the center of the page look for "Create A Repository" and click on it
5. Name the repository: ubuntu-apache
6. Keep private or make public, it's your choice
7. Click on the "Create" button

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

### 📋 Clone or Download

If you prefer to use git clone you can do so or you can download the zip package of the repository.

1. Git Clone URL: <https://github.com/<your-docker-account-name>/Docker.git>
2. Git Clone SSH: <git@github.com>:<your-docker-account-name>/Docker.git
3. Zip File: <https://github.com/<your-docker-account-name>/Docker/archive/refs/heads/main.zip>
   1. Extract the zip file to a directory of your choice

### 📁 Repository Structure

   ```angular2html
   ubuntu-apache
   ├── apache
   │   ├── conf
   │   │   ├── apache.conf
   │   │   └── security.conf
   │   ├── images
   │   │   ├── apache.png
   │   │   ├── docker.svg
   │   │   └── ubuntu.png
   │   └── shell
   │       └── start.sh
   └── apache.Dockerfile
   ```

## ✨ Docker Magic

### 📝 Placeholders

Throughout the rest of the steps, you will need to replace these placeholders:

1. Replace the `<your-docker-account-name>` with your Docker account name
2. Replace the `<your-docker-repository-name>` with your Docker repository name

### 🔨 Build Docker Image

To build the Docker image, follow these steps:

1. Edit apache.Dockerfile to your needs
   - For simple use: you can leave it as is, however, I would update the LABELS to your needs
   - For more complex use: you can change the base image, Apache configuration, or any other settings as required
   - Ensure that the paths in the Dockerfile match the structure of your project
2. Open a terminal
3. Change directory to ubuntu-apache: cd /path/to/ubuntu-apache

4. Run the following command:

   ```bash
   docker build -t <your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0 -f apache.Dockerfile .
   ```

   Output:

   ```angular2html
   ❯ docker build -t <your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0 -f apache.Dockerfile .
   [+] Building 0.9s (13/13) FINISHED                                                                                                                                                                                                                                                            docker:desktop-linux
   => [internal] load build definition from apache.Dockerfile                                                                                                                                                                                                                                                   0.0s
   => => transferring dockerfile: 1.36kB                                                                                                                                                                                                                                                                        0.0s
   => [internal] load metadata for docker.io/library/ubuntu:24.04                                                                                                                                                                                                                                               0.5s
   => [internal] load .dockerignore                                                                                                                                                                                                                                                                             0.0s
   => => transferring context: 2B                                                                                                                                                                                                                                                                               0.0s
   => [1/8] FROM docker.io/library/ubuntu:24.04@sha256:a08e551cb33850e4740772b38217fc1796a66da2506d312abe51acda354ff061                                                                                                                                                                                         0.0s
   => => resolve docker.io/library/ubuntu:24.04@sha256:a08e551cb33850e4740772b38217fc1796a66da2506d312abe51acda354ff061                                                                                                                                                                                         0.0s
   => [internal] load build context                                                                                                                                                                                                                                                                             0.0s
   => => transferring context: 373B                                                                                                                                                                                                                                                                             0.0s
   => CACHED [2/8] RUN apt-get update &&     apt-get install -y apache2 &&     apt-get clean &&     rm -rf /var/lib/apt/lists/* &&     a2enmod headers                                                                                                                                                          0.0s
   => CACHED [3/8] COPY ./shell/start.sh /usr/local/bin/start.sh                                                                                                                                                                                                                                                0.0s
   => CACHED [4/8] RUN chmod +x /usr/local/bin/start.sh                                                                                                                                                                                                                                                         0.0s
   => CACHED [5/8] COPY ./apache/images/*.png /var/www/html/images/                                                                                                                                                                                                                                             0.0s
   => CACHED [6/8] COPY ./apache/images/*.svg /var/www/html/images/                                                                                                                                                                                                                                             0.0s
   => CACHED [7/8] COPY ./apache/conf/apache.conf /etc/apache2/sites-available/000-default.conf                                                                                                                                                                                                                 0.0s
   => CACHED [8/8] COPY ./apache/conf/security.conf /etc/apache2/conf-available/security.conf                                                                                                                                                                                                                   0.0s
   => exporting to image                                                                                                                                                                                                                                                                                        0.4s
   => => exporting layers                                                                                                                                                                                                                                                                                       0.0s
   => => exporting manifest sha256:16e0169ce88e61a573ef7232c1a9c9cb0616aa3b4f53ab2fd2e14157bcdbaddf                                                                                                                                                                                                             0.0s
   => => exporting config sha256:f39e2c819c01dd9f805eab9971bb58a83341381349ce335501874794511d5ef9                                                                                                                                                                                                               0.0s
   => => exporting attestation manifest sha256:c0b1a07454f15b9f5f5ccf6eb45b4ab2178daf28e7669e2e10341a4b62ef7426                                                                                                                                                                                                 0.0s
   => => exporting manifest list sha256:8c7e59017a80f41d2150b6820843408f63536055610c1df593acb02d1444facf                                                                                                                                                                                                        0.0s
   => => naming to docker.io/<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0                                                                                                                                                                                                                                             0.0s
   => => unpacking to docker.io/<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0
   ```

5. Command breakdown:
   1. `⁠docker build`
      - This command is used to build a Docker image from a Dockerfile
   2. `⁠-t <your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0`
      - `⁠-t`: This option tags the image with a name and optionally a version
      - `⁠<your-docker-account-name>/<your-docker-respository-name>:`: The name of the Docker image consists of our Docker Account Name followed by / then the repository name
      - `⁠ubuntu-apache-1.0`: The specific tag of the image, indicating the version or variant of the image
   3. `⁠-f apache.Dockerfile`
      - `⁠-f`: This option specifies the Dockerfile to use for building the image
      - `⁠apache.Dockerfile`: The name of the Dockerfile in the current directory
   4. `⁠.`
      - The dot at the end specifies the build context, which is the current directory. Docker will look for the Dockerfile and any files it needs in this directory 
   5. The build process will read the Dockerfile, execute the instructions, and create a new Docker image with the specified tag
   6. Once the build is complete, you can verify the image by running:

   ```bash
   docker images
   ```

   Output:

   ```angular2html
   ❯ docker images
   REPOSITORY             TAG                 IMAGE ID       CREATED          SIZE
   <your-docker-account-name>/<your-docker-repository-name>   ubuntu-apache-1.0   8c7e59017a80   14 minutes ago   313MB
   ```

### 🔐 Login to Docker Hub - CLI

To log in to Docker Hub, follow these steps:

1. While still in the terminal
2. Run the following command, for password, use your Docker Personal Access Token (PAT) instead of your Docker account password:

   ```bash
   docker login -u <your-docker-account-name>
   ```

   Output:

   ```angular2html
   ❯ docker login -u <your-docker-account-name>

   i Info → A Personal Access Token (PAT) can be used instead.
            To create a PAT, visit https://app.docker.com/settings


   Password:
   Login Succeeded
   ```

3. Command breakdown:
   1. `⁠docker login`
      - This command is used to authenticate with a Docker registry (in this case, Docker Hub)
   2. `⁠-u <your-docker-account-name>`
      - `⁠-u`: This option specifies the username to log in with
      - `⁠<your-docker-account-name>`: This is your Docker account name
   3. The command will prompt you for your password, which should be your Docker Personal Access Token (PAT) instead of your Docker account password
   4. If the login is successful, you will see the message "Login Succeeded"

### 📤 Push the image to Docker Hub

To push the Docker image to Docker Hub, follow these steps:

1. Run the following command:

   ```bash
   docker push <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
   ```

   Output:

   ```angular2html
   ❯ docker push <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
   The push refers to repository [docker.io/<your-docker-account-name>/<your-docker-repository-name>]
   ef83433d856c: Pushed 
   2832e7904788: Pushed 
   ae5c819eef4b: Pushed 
   915917b19136: Pushed 
   e3bd89a9dac5: Pushed 
   29800c931487: Pushed 
   263032e19a10: Pushed 
   952a89d51ba8: Pushed 
   60bd2593e547: Pushed 
   ubuntu-apache-1.0: digest: sha256:8c7e59017a80f41d2150b6820843408f63536055610c1df593acb02d1444facf size: 856
   ```

2. Validate the image is in your Docker Hub repository run the following command:

   ```bash
   docker search <your-docker-account-name>/<your-docker-repository-name>
   ```

   Output:

   ```angular2html
   ❯ curl -s https://registry.hub.docker.com/v2/repositories/<your-docker-account-name>/<your-docker-repository-name>/
   {"user":"<your-docker-account-name>","name":"<your-docker-repository-name>","namespace":"<your-docker-account-name>","repository_type":"image","status":1,"status_description":"active","description":"My repository to store projects for Docker.","is_private":false,"is_automated":false,"star_count":0,"pull_count":0,"last_updated":"2025-08-01T21:05:46.09929Z","last_modified":"2025-08-01T20:01:30.815727Z","date_registered":"2025-08-01T20:00:15.90984Z","collaborator_count":0,"affiliation":null,"hub_user":"<your-docker-account-name>","has_starred":false,"permissions":{"read":true,"write":false,"admin":false},"media_types":["application/vnd.oci.image.index.v1+json"],"content_types":["image"],"categories":[],"immutable_tags_settings":{"enabled":true,"rules":[".*"]},"storage_size":66648505}
   ```

3. Command breakdown:
   1. `⁠docker push`
        - This command is used to upload a Docker image to a registry (in this case, Docker Hub)
   2. `⁠<your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0`
        - This specifies the image to push, including the repository name and tag
   3. The command will upload the image layers and metadata to Docker Hub, making it available for others to pull

### 🗑️ Delete Local Image

To delete the local Docker image, you can use the following command:

```bash
docker rmi <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
```

Output:

```angular2html
❯ docker rmi <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
Untagged: <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
Deleted: sha256:8c7e59017a80f41d2150b6820843408f63536055610c1df593acb02d1444facf
```

- Command breakdown:
  1. `⁠docker rmi`
     - This command is used to remove a Docker image from your local machine
  2. `⁠<your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0`
     - This specifies the image to remove, including the repository name and tag
  3. The command will delete the specified image from your local Docker environment

### 📥 Download Image From Docker Hub

To download the Docker image from Docker Hub, you can use the following command:

```bash
docker pull <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
```

Output:

```angular2html
docker pull <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
ubuntu-apache-1.0: Pulling from <your-docker-account-name>/<your-docker-repository-name>
915917b19136: Pull complete 
ef83433d856c: Pull complete 
29800c931487: Pull complete 
952a89d51ba8: Pull complete 
263032e19a10: Pull complete 
2832e7904788: Pull complete 
60bd2593e547: Pull complete 
Digest: sha256:8c7e59017a80f41d2150b6820843408f63536055610c1df593acb02d1444facf
Status: Downloaded newer image for carrick<your-docker-account-name>cancloud/<your-docker-repository-name>:ubuntu-apache-1.0
docker.io/<your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.
```

- Command breakdown:
  1. `⁠docker pull`
     - This command is used to download a Docker image from a registry (in this case, Docker Hub)
  2. `⁠<your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0`
     - This specifies the image to pull, including the repository name and tag
  3. The command will download the image layers and metadata from Docker Hub to your local machine

### 🚀 Launch Docker Container

To launch a Docker container, follow these steps:

1. Run the following command:

   ```bash
   docker run -d -p 8000:80 \
   --restart unless-stopped \
   -v "$(pwd)/logs/1:/var/log/apache2" \
   <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
   ```

   Output:

   ```angular2html
   ❯ docker run -d -p 8000:80 \
   --restart unless-stopped \
   -v "$(pwd)/logs/1:/var/log/apache2" \
   <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
   2f55408bdef8aa4f69c21591c1e16fa0228144e89a68f4c4e9f90d363a82fe81
   ```

2. Command breakdown:
   1. `⁠docker run`
      - This command is used to create and start a new container from a specified image
   2. ⁠`-d`
      - Detached Mode: This flag runs the container in detached mode, meaning it runs in the background and does not block your terminal
   3. `⁠-p 8000:80`
      - `-p`: Port Mapping: This option maps port ⁠8000 on the host machine to port ⁠80 on the container
      - Host Port (`8000`): The port you will use to access the application from your host machine
      - Container Port (`80`): The port on which the application inside the container listens (commonly used for web servers)
   4. `⁠--restart unless-stopped`
      - `restart`: This option sets the restart policy for the container
      - `⁠unless-stopped`: The container will automatically restart unless it has been manually stopped. This is useful for ensuring that your application stays running
   5. `⁠-v "$(pwd)/logs/1:/var/log/apache2"`
      - `-v`: Volume Mapping: This option mounts a directory from the host into the container
      - ⁠`$(pwd)/logs/1:`: This is the path on the host machine where logs will be stored. The ⁠$(pwd) command gets the current working directory
      - `⁠/var/log/apache2`: This is the path inside the container where Apache logs are stored. By mounting this directory, you can access the logs directly from your host
   6. `⁠<your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0`
      - Image Name and Tag: This specifies the Docker image to use for creating the container
      - `⁠<your-docker-account-name>/<your-docker-repository-name>:`: The name of the Docker image consists of our Docker Account Name followed by / then the repository name
      - `⁠ubuntu-apache-1.0`: The specific tag of the image, indicating the version or variant of the image

3. After running the command, you can check if the container is running by executing:

   ```bash
   docker ps
   ```

   Output:

   ```angular2html
   ❯ docker ps
   CONTAINER ID   IMAGE                                                                         COMMAND                  CREATED         STATUS         PORTS                                     NAMES
   2f55408bdef8   <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0   "/usr/local/bin/star…"   2 minutes ago   Up 2 minutes   0.0.0.0:8000->80/tcp, [::]:8000->80/tcp   naughty_austin
   ```

   - Command breakdown:
     1. `⁠docker ps`
        - This command lists all running Docker containers
     2. The output will show the container ID, image name, command, creation time, status, ports, and names of the running containers
     3. You should see your newly created container with the specified image and port mapping

### 🌐 Create Docker Network

To create a Docker network, you can use the following command:

```bash
docker network create web-network
```

Output:

```angular2html
docker network create web-network
7a722c711b40dadb2bd16a34429b19de91bba40cef95049170e9f896fa8a8956
```

- Command breakdown:
  1. `⁠docker network create`
     - This command is used to create a new Docker network
  2. `web-network`
     - This specifies the name of the network you want to create
  3. The command will create a new Docker network with the specified name, which can be used to connect containers together

### 🚀 Launch Docker Container on Web-Network

1. Run the following command:

   ```bash
   docker run -d -p 9000:80 \
   --restart unless-stopped \
   --network web-network \
   -v "$(pwd)/logs/2:/var/log/apache2" \
   <your-docker-account-name>/<your-docker-repository-name>:ubuntu-apache-1.0
   ```

   Output:

   ```angular2html
   ❯ docker run -d -p 8000:80 \
   --restart unless-stopped \
   --network web-network \
   -v "$(pwd)/logs/2:/var/log/apache2" \
   <your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0
   ccf75f64368fe54b78db50758b8afb73197a966325f097d32f4a1941705aabec
   ```

2. Command breakdown:
   1. `⁠docker run`
      - This command is used to create and start a new container from a specified image
   2. ⁠`-d`
      - Detached Mode: This flag runs the container in detached mode, meaning it runs in the background and does not block your terminal
   3. `⁠-p 8000:80`
      - `-p`: Port Mapping: This option maps port ⁠8000 on the host machine to port ⁠80 on the container
      - Host Port (`8000`): The port you will use to access the application from your host machine
      - Container Port (`80`): The port on which the application inside the container listens (commonly used for web servers)
   4. `⁠--restart unless-stopped`
      - `restart`: This option sets the restart policy for the container
      - `⁠unless-stopped`: The container will automatically restart unless it has been manually stopped. This is useful for ensuring that your application stays running
   5. `⁠--network web-network`
      - `⁠--network`: This option specifies the Docker network to connect the container to
      - `⁠web-network`: The name of the Docker network you want to connect the container to
   6. `⁠-v "$(pwd)/logs/1:/var/log/apache2"`
      - `-v`: Volume Mapping: This option mounts a directory from the host into the container
      - ⁠`$(pwd)/logs/1:`: This is the path on the host machine where logs will be stored. The ⁠$(pwd) command gets the current working directory
      - `⁠/var/log/apache2`: This is the path inside the container where Apache logs are stored. By mounting this directory, you can access the logs directly from your host
   7. `⁠<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0`
      - Image Name and Tag: This specifies the Docker image to use for creating the container
      - `⁠<your-docker-account-name>/<your-docker-respository-name>:`: The name of the Docker image consists of our Docker Account Name followed by / then the repository name
      - `⁠ubuntu-apache-1.0`: The specific tag of the image, indicating the version or variant of the image

3. After running the command, you can check if the container is running by executing:

   ```bash
   docker ps
   ```

   Output:

   ```angular2html
   ❯ docker ps
   CONTAINER ID   IMAGE                                    COMMAND                  CREATED              STATUS              PORTS                                     NAMES
   ccf75f64368f   ⁠<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0   "/usr/local/bin/star…"   About a minute ago   Up About a minute   0.0.0.0:9000->80/tcp, [::]:9000->80/tcp   wizardly_fermi
   2f55408bdef8   ⁠<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0   "/usr/local/bin/star…"   9 minutes ago        Up 9 minutes        0.0.0.0:8000->80/tcp, [::]:8000->80/tcp   nifty_bassi

## ✅ Validate Our Work

To validate that the containers are running correctly follow these steps:

1. Docker PS Command:

   ```bash
   docker ps
   ```

   Output:

   ```angular2html
   ❯ docker ps
   CONTAINER ID   IMAGE                                    COMMAND                  CREATED              STATUS              PORTS                                     NAMES
   ccf75f64368f   ⁠<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0   "/usr/local/bin/star…"   About a minute ago   Up About a minute   0.0.0.0:9000->80/tcp, [::]:9000->80/tcp   wizardly_fermi
   2f55408bdef8   ⁠<your-docker-account-name>/<your-docker-respository-name>:ubuntu-apache-1.0   "/usr/local/bin/star…"   9 minutes ago        Up 9 minutes        0.0.0.0:8000->80/tcp, [::]:8000->80/tcp   nifty_bassi
   ```

2. Docker Network ls Command:

   ```bash
   docker network ls
   ```

   Output:

   ```angular2html
   ❯ docker network ls
   NETWORK ID     NAME          DRIVER    SCOPE
   158d9891a529   bridge        bridge    local
   035b23d1ebc9   host          host      local
   d0dc17b7cf75   none          null      local
   7a722c711b40   web-network   bridge    local
   ```

3. Docker Network Inspect Web-Network Command:
   - Look for the `Containers` section to see the containers connected to this network

   ```bash
   docker network inspect web-network
   ```

   Output:

   ```angular2html
   [
    {
        "Name": "web-network",
        "Id": "7a722c711b40dadb2bd16a34429b19de91bba40cef95049170e9f896fa8a8956",
        "Created": "2025-08-01T21:42:53.480127917Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "ccf75f64368fe54b78db50758b8afb73197a966325f097d32f4a1941705aabec": {
                "Name": "wizardly_fermi",
                "EndpointID": "158e1de276e095109633d8ed7a81faae61923da3a5cacaa07f635747286197d0",
                "MacAddress": "be:a7:32:04:d7:d8",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.enable_ipv4": "true",
            "com.docker.network.enable_ipv6": "false"
        },
        "Labels": {}
      }
   ]
   ```

4. Docker Network Inspect Bridge Command:
   - Look for the `Containers` section to see the containers connected to this network

   ```bash
   docker network inspect bridge
   ```

   Output:

   ```angular2html
   ❯ docker network inspect bridge
   [
      {
         "Name": "bridge",
         "Id": "158d9891a529c7dc586ee09add62b0f8071d83dc659de6ebf496ea4de32ee5d1",
         "Created": "2025-08-01T21:38:51.671575125Z",
         "Scope": "local",
         "Driver": "bridge",
         "EnableIPv4": true,
         "EnableIPv6": false,
         "IPAM": {
               "Driver": "default",
               "Options": null,
               "Config": [
                  {
                     "Subnet": "172.17.0.0/16",
                     "Gateway": "172.17.0.1"
                  }
               ]
         },
         "Internal": false,
         "Attachable": false,
         "Ingress": false,
         "ConfigFrom": {
               "Network": ""
         },
         "ConfigOnly": false,
         "Containers": {
               "2f55408bdef8aa4f69c21591c1e16fa0228144e89a68f4c4e9f90d363a82fe81": {
                  "Name": "nifty_bassi",
                  "EndpointID": "793330cc2e31a1472a26c3a229cef7f9c7e08b275e5be37216753c62791efde8",
                  "MacAddress": "ae:fb:fe:87:9b:f3",
                  "IPv4Address": "172.17.0.2/16",
                  "IPv6Address": ""
               }
         },
         "Options": {
               "com.docker.network.bridge.default_bridge": "true",
               "com.docker.network.bridge.enable_icc": "true",
               "com.docker.network.bridge.enable_ip_masquerade": "true",
               "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
               "com.docker.network.bridge.name": "docker0",
               "com.docker.network.driver.mtu": "65535"
         },
         "Labels": {}
      }
   ]
   ```

### 🌍 Access the Web Application

To access the application running in the Docker container, open a web browser and navigate to:

   ```http
   http://localhost:8000

   http://localhost:9000
   ```

- You should see a Custom Apache welcome page.

### 📄 Review Apache Logs

To review the Apache logs, you can check the log files in the mounted directory on your host machine:

```bash
# Bridged Network: 
cat logs/1/error.log
cat logs/1/access.log

# Web Network:
cat logs/2/error.log
cat logs/2/access.log
```

## 🏁 Conclusion

This repository provides a hands-on foundation for containerization and deployment using Docker and Apache on Ubuntu. By following the steps above, DevOps engineers and aspiring professionals can build, run, and manage web applications in isolated environments, leverage Docker Hub for image distribution, and utilize custom networks for scalable architectures.

**Best Practices:**

- Secure your Docker credentials and Personal Access Tokens (PAT) 🔒
- Regularly review logs and container status for operational insights
- Experiment with Dockerfile and configuration options to fit your project needs

Whether you’re new to DevOps or expanding your skills, this project is designed to help you master essential workflows for modern infrastructure. Happy shipping! 🚀