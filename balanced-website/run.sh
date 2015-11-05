PORT1=9001
NAME1=node1

PORT2=9002
NAME2=node2

PORTNGINX=9000
NAMENGINX=nginx-loadbalancer

PORTHAPROXY=9010
NAMEHAPROXY=haproxy-loadbalancer



docker run -d -p ${PORT1}:80 --name=${NAME1} -v $(pwd)/node1:/usr/share/nginx/html nginx
docker run -d -p ${PORT2}:80 --name=${NAME2} -v $(pwd)/node2:/usr/share/nginx/html nginx

docker run -p ${PORTNGINX}:80 --name=${NAMENGINX} -d --link node1:node1 --link node2:node2 -v $(pwd)/ngnix:/etc/nginx nginx
docker run -p ${PORTHAPROXY}:80 --name=${NAMEHAPROXY} -d --link node1:node1 --link node2:node2 -v $(pwd)/haproxy:/usr/local/etc/haproxy/ haproxy


echo "Node 1:  $(docker-machine ip default):${PORT1}"
echo "Node 2:  $(docker-machine ip default):${PORT2}"
echo "Ngnix:   $(docker-machine ip default):${PORTNGINX}"
echo "HaProxy: $(docker-machine ip default):${PORTHAPROXY}"
