# Week-5 challenge (docker) solutions

- **Introduction and Purpose:** Understand Docker’s role in modern development.
- **Virtualization vs. Containerization:** Learn the differences and benefits.
- **Build Kya Hota Hai:** Understand the Docker build process.
- **Docker Terminologies:** Get familiar with key Docker terms.
- **Docker Components:** Explore Docker Engine, images, containers, and more.
- **Project Building Using Docker:** Containerize a sample project.
- **Multi-stage Docker Builds / Distroless Images:** Optimize your images.
- **Docker Hub (Push/Tag/Pull):** Manage and distribute your Docker images.
- **Docker Volumes:** Persist data across container runs.
- **Docker Networking:** Connect containers using networks.
- **Docker Compose:** Orchestrate multi-container applications.
- **Docker Scout:** Analyze your images for vulnerabilities and insights.

## Tasks-1 : Introduction and Conceptual Understanding

### 1. Introduction and Purpose:

- When DevOps field is emerging the requirement of consistent environment across all stages is become important so docker comes in picture with ensuring that applications run the same way in development, testing and production by packaging code with all its dependencies into isolated containers.

- In modern development and deployment life-cycle docker/containerization simplified deployment and scalability like ... developers can easily deploy and scale microservices-based applications using docker containers, making CI/CD pipelines faster and more reliable.

### 2. Virtualization vs. Containerization:

Virtualization and containerization are both used to isolate applications for better scalability, security, and resource management, but they differ fundamentally in how they operate.

| Aspect         | Virtualization                                 | Containerization                   |
| -------------- | ---------------------------------------------- | ---------------------------------- |
| OS Level       | Includes full guest OS                         | Shares host OS kernel              |
| Resource Usage | Heavy (requires more CPU, RAM, storage)        | Lightweight and efficient          |
| Boot Time      | Slower (minutes)                               | Faster (seconds)                   |
| Isolation      | Stronger (complete OS separation)              | Moderate (process-level isolation) |
| Use Case       | Best for running different OSes or legacy apps | Ideal for microservices and DevOps |

### 3. Build Kya Hota Hai.

- Docker build process creates a container image from a set of instructions written in a Dockerfile.

- Each instruction in the Dockerfile creates a new layer in the image.

- The docker build command reads the Dockerfile, executes the instructions and assembles the image step by step.

- Docker caches layers to speed up rebuilds, so unchanged layers are reused in future builds.

- The final image can be run as a container using the docker run command.

## Task-2 : Create a Dockerfile for a Sample Project

https://github.com/adityagaikwad888/git-jenkin-docker.git

used this code and made docker image & container locally tested successfuly and screen-shot added.

used commands :

docker build -t simple-js-app .
docker run -d -p 3000:3000 --name mycontainer-1 simple-js-app:latest
docker stop mycontainer-1
docker rm mycontainer-1

## Task-3 : Docker Terminologies and Components

#### Docker Terminologies

1. Image : A lightweight, standalone & immutable file that contains the code, runtime, libraries and dependencies needed to run an application.

2. Container : A runnable instance of an image that is isolated and runs the application with all required resources.

3. Dockerfile : A text file with a set of instructions used to build a Docker image.

4. Docker Hub : A cloud-based registry where Docker images can be stored, shared and downloaded.

5. Volume : A persistent storage mechanism used to store data outside of the container lifecycle.

6. Network : Docker provides isolated networks so containers can communicate securely and efficiently.

7. Registry : A storage and content delivery system for Docker images (public or private).

8. Layer : Each instruction in a Dockerfile creates a new layer; together, they form the image.

#### Docker Components

1. Docker Engine - core component that runs and manages Docker containers; it includes the Docker Daemon, REST APT & CLI

2. Docker Daemon (dockerd) - background process that handles building, runing & managing Docker containers.

3. Docker CLI - the command-line interface that developers use to interact with the Docker Daemon.

4. Above all Docker terminologies

## Task-4 : Optimize Docker Image with Multi-Stage Builds

https://github.com/adityagaikwad888/git-jenkin-docker.git

used this code and made docker image & container locally tested successfuly and screen-shot added

docker build -t simple-js-app-distroless .
docker run -d -p 3000:3000 --name mycontainer-1 simple-js-app-distroless:latest
docker stop mycontainer-1
docker rm mycontainer-1

## Task-5 : Manage Your Image with Docker Hub

completed see screen-shot in ScreenShot dir

## Task-6 : Persist Data with Docker Volumes

### 🔹 What Are Docker Volumes?

Docker volumes are a **mechanism for persisting data** generated and used by Docker containers. Unlike a container's internal filesystem (which is destroyed when the container stops or is removed), volumes are stored **outside the container lifecycle** on the host system.

---

### 🔹 Why Are They Useful?

- **Data Persistence**  
  Volumes ensure that important data isn't lost when containers are stopped, removed, or updated.

- **Separation of Concerns**  
  Application logic runs in containers, while persistent data is managed separately via volumes, keeping architecture clean and modular.

- **Portability & Backups**  
  Volumes can be easily backed up, transferred, or reused across environments or containers.

- **Performance**  
  Volumes offer better I/O performance than bind mounts, as they're optimized by Docker.

- **Security & Isolation**  
  Docker manages volume paths securely, reducing risks of unauthorized access and increasing data isolation.

---

Hands-on screen-shot added

## Task-7 : Configure Docker Networking

#### 🔹 What Is Docker Networking?

Docker networking allows containers to communicate with each other, with the host, and with external systems. By creating isolated networks, Docker ensures secure and structured communication between services.

---

### 🔹 Why Is It Important in Multi-Container Applications?

- **Inter-Container Communication**  
  Containers in the same network can communicate using their container names as hostnames. This is crucial for microservices architecture, where services like APIs, databases, and frontends must interact.

- **Network Isolation**  
  Docker provides different network drivers (e.g., `bridge`, `host`, `overlay`) to isolate traffic and control access between containers.

- **Scalability**  
  In orchestrated environments (like Docker Compose or Kubernetes), services can scale horizontally while maintaining seamless communication over defined networks.

- **Security**  
  Networks can be designed to limit communication only between required services, reducing the attack surface.

---

### Example (Using Docker Compose)

```yaml
services:
  web:
    image: nginx
    networks:
      - app-network

  app:
    image: my-node-app
    networks:
      - app-network

networks:
  app-network:
```

## Task-8 :

### 🔹 `version: "3.8"`

Specifies the version of the Docker Compose file format being used. Version `3.8` is compatible with recent Docker Engine versions and supports advanced features like `depends_on`, `healthcheck`, and named volumes/networks.

---

## 🔹 Services

### `mysql` Service

This sets up a MySQL 5.7 database container.

- **user: "${UID}:${GID}"**  
  Runs the container with the host user’s UID and GID, passed through environment variables — useful for avoiding permission issues with mounted volumes.

- **image: mysql:5.7**  
  Pulls the official MySQL version 5.7 image.

- **container_name: mysql**  
  Assigns a custom name to the container.

- **environment:**

  - `MYSQL_ROOT_PASSWORD`: root password for MySQL.
  - `MYSQL_DATABASE`: default database to be created.
  - `MYSQL_USER` and `MYSQL_PASSWORD`: creates a new user with specified credentials.

- **volumes:**

  - `./mysql-data:/var/lib/mysql`: persists database data on the host.
  - `./message.sql:/docker-entrypoint-initdb.d/message.sql`: initializes the DB with the provided SQL script.

- **networks:**  
  Connects the container to the custom network `twotier`.

- **healthcheck:**  
  Monitors container readiness by pinging MySQL:
  ```bash
  mysqladmin ping -h localhost -uroot -proot
  ```

## Task-9 :

### Vulnerabilities Summary

| Severity | Count |
| -------- | ----- |
| Critical | 0     |
| High     | 1     |
| Medium   | 0     |
| Low      | 2     |

- Total Vulnerabilities: 3
- Total Affected Packages: 2
- Total Layers Scanned: 284

---

### Identified CVEs and Details

### 1. CVE-2024-21538

- Severity: High
- Package: cross-spawn@7.0.3
- Issue: Inefficient Regular Expression Complexity
- Affected Range: >=7.0.0
- Fixed Version: 7.0.4
- Remediation: Update `cross-spawn` to version 7.0.4 or later
- Reference: [CVE-2024-21538](https://scout.docker.com/v/CVE-2024-21538)

### 2. CVE-2025-5889 (Repeated Twice)

- Severity: Low
- Package: brace-expansion@2.0.1
- Issue: Uncontrolled Resource Consumption
- Affected Range: >=2.0.0 <2.0.2
- Fixed Version: 2.0.2
- Remediation: Upgrade `brace-expansion` to version 2.0.2
- Reference: [CVE-2025-5889](https://scout.docker.com/v/CVE-2025-5889)

---

### Affected Layers/Dependencies

The vulnerabilities are located in application dependencies that were installed via npm. These are part of the user-layer of the image and not part of the base image itself. Specifically:

- `cross-spawn` and `brace-expansion` are common utilities used in JavaScript environments.
- These packages were introduced during the `npm install` step during image build.

---

### Suggested Remediations

1. **Update Dependencies**

   - Modify `package.json` to use fixed versions: `cross-spawn@7.0.4`, `brace-expansion@2.0.2`.
   - Run `npm update` or manually install the fixed versions.
   - Rebuild the Docker image to apply changes.

2. **Re-scan After Fix**

   - Use Docker Scout to re-scan the updated image and verify that vulnerabilities are resolved.

3. **Check Official Recommendations**
   - You can view image-specific update suggestions at:  
     [Docker Scout Recommendations](https://scout.docker.com/adityagaikwad888/simple-js-app:v1.0)

---

### Comparison with Previous Builds

If this is the initial security scan, it serves as a baseline for future comparisons. In later scans, you should assess changes in the number and severity of vulnerabilities to determine if your image security posture has improved or worsened.

---

### Reflection and Strategy

- This report demonstrates how small and common dependencies can introduce security issues.
- Regularly auditing and updating dependencies is essential.
- Integrating Docker Scout, Trivy, or similar tools into a CI/CD pipeline ensures continuous vulnerability scanning.
- Building images with security in mind helps reduce risk and improves maintainability.

---
