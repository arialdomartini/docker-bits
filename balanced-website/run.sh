PORT1=9001
NAME1=node1

PORT2=9002
NAME2=node2

PORTLB=9000
NAMELB=loadbalancer



docker run -d -p ${PORT1}:80 --name=${NAME1} -v $(pwd)/site1:/usr/share/nginx/html nginx
docker run -d -p ${PORT2}:80 --name=${NAME2} -v $(pwd)/site2:/usr/share/nginx/html nginx

docker run -p ${PORTLB}:80 --name=${NAMELB} -d --link node1:node1 --link node2:node2 -v $(pwd)/loadbalancer:/etc/nginx nginx

echo $(docker-machine ip default):${PORT1}
echo $(docker-machine ip default):${PORT2}
echo $(docker-machine ip default):${PORTLB}
