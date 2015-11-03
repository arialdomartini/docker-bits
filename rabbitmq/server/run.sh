docker run -d --hostname my-rabbit --name some-rabbit rabbitmq:3.5.6
docker run -d --hostname my-rabbit --name some-rabbit-management -p 8080:15672  rabbitmq:3.5.6-management
echo "Visit $(docker-machine ip default):8080"
