#!/bin/bash

# Get the absolute directory path of the script
project_dir=$(dirname "$(readlink -f "$0")")

# Define the container name and the image name
container_name="fundamentals-of-robotics"
image_name="ghcr.io/m1cov/robotika-1:latest"

if [ "$1" == "--build" ]; then
    echo "Building an image..."
    podman build -t "$image_name" "$project_dir"

    if [ "$2" == "--push" ]; then
        echo "Pushing the image to GitLab registry..."
        podman push "$image_name"
    fi

else
    echo "Pulling the latest image..."
    podman pull "$image_name"

    echo "Spinning a new container..."
    podman run -it --rm --replace -p 8888:8888 -v "$project_dir:/app:Z" --name "$container_name" "$image_name"
fi
