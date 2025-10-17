# Conference BINGO

This project is a conference bingo game with a Flutter frontend and a Laravel backend.

Frontend
<img width="499" height="565" alt="image" src="https://github.com/user-attachments/assets/c57c0d7c-2897-4ade-8947-af86e8187c0c" />

Backend
<img width="1468" height="435" alt="image" src="https://github.com/user-attachments/assets/c5e6e9c2-5d73-4aa8-9641-d330b2fba949" />



## Prerequisites

Make sure you have the following installed on your system:

- Docker
- Docker Compose

## Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Build the Flutter base image**

   To speed up the frontend build process, you need to build the Flutter base image first:

   ```bash
   docker build -t flutter-base:latest -f docker/flutter/flutter.Dockerfile .
   ```

3. **Set up the environment file**

   The project uses a `.env` file in the root directory for configuration. Make sure this file exists and contains the necessary environment variables. The `API_BASE_URL` for the frontend is already configured in this file.

4. **Run the project**

   Use Docker Compose to build and run the services in detached mode:

   ```bash
   docker-compose up --build -d
   ```

## Services

Once the services are running, you can access them at the following URLs:

- **Frontend**: [http://localhost:8080](http://localhost:8080)
- **Backend**: [http://localhost:8000](http://localhost:8000)
