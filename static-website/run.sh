PORT=8085
IMAGE_NAME=static-website
docker run -d -p=${PORT}:80 --name=${IMAGE_NAME} arialdo/static-website

docker port ${IMAGE_NAME}
echo $(docker-machine ip default):${PORT}
