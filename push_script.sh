#!/bin/bash

echo "Starting push..."

# ล็อกอินเข้า Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# สร้าง Docker imag
docker build -t myapp .

# Tag Docker image สำหรับ push
docker tag myapp "$DOCKER_USERNAME/myapp:latest"

# Push Docker image ไปยัง Docker Hub
docker push "$DOCKER_USERNAME/myapp:latest"

# รัน Docker container
container_id=$(docker run -d -p 3000:3000 myapp)

# ตรวจสอบสถานะของ container
if [ "$(docker ps -q -f id=$container_id)" ]; then
    echo "Container is running."
else
    echo "Container is not running."
    exit 1
fi

echo "push complete!"
