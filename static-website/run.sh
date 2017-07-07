PORT=8080
CONTAINER_NAME=static-website
IMAGE_NAME=arialdo/static-website:1.1
docker run -d -p=${PORT}:8080 --name=${CONTAINER_NAME} ${IMAGE_NAME}

docker port ${CONTAINER_NAME}
echo 127.0.0.1:${PORT}
