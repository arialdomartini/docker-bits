set -e

echo "===> Creating 3 virtual machines..."
for N in 1 2 3; do docker-machine create --driver virtualbox node$N; done

echo "\n\n\n===> Creating the swarm..."
echo "===> Making node1 the manager of the swarm"
eval `docker-machine env node1`
node1=`docker-machine ip node1`
docker swarm init --advertise-addr=${node1}
token=`docker swarm join-token -q worker`

echo "\n\n\n===> Configuring node2 as a worker in the swarm"
eval `docker-machine env node2`
docker swarm join \
   --token ${token} \
   ${node1}:2377

echo "\n\n\n===> Configuring node3 as a worker in the swarm"
eval `docker-machine env node3`
docker swarm join \
   --token ${token} \
   ${node1}:2377

echo "\n\n\n===> Creating the app docker image"
eval `docker-machine env node1`
docker build -t arialdomartini/sample-swarm-app:latest .
#docker login
docker push arialdomartini/sample-swarm-app

echo "\n\n\n===> Running 3 instances of the app in the swarm"
docker service create --name=app --replicas=5 --publish 5000:5000 arialdomartini/sample-swarm-app
