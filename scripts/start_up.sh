#!/bin/bash

# Start Docker Compose services in detached mode
docker-compose up -d

# Check the status of the services
docker-compose ps

echo "SonarQube and PostgreSQL services have been started."
echo "You can access SonarQube at http://localhost:9000"
