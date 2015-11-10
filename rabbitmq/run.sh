HOSTN=some-rabbit
RABBITNODENAME=some-rabbit

#docker run -d   --hostname $HOSTN --name some-rabbit -e RABBITMQ_ERLANG_COOKIE='SECRET99182' -e RABBITMQ_NODENAME=$RABBITNODENAME rabbitmq:3.5.6
docker run -d   --hostname $HOSTN --name some-rabbit-management -p 8080:15672 -e RABBITMQ_ERLANG_COOKIE='SECRET99182' -e RABBITMQ_NODENAME=$RABBITNODENAME rabbitmq:3.5.6-management
docker run -ti  --hostname $HOSTN --name some-rabbit-client --link some-rabbit-management --dns 8.8.8.8 -v $(pwd)/pyth:/var/pyth -e RABBITMQ_ERLANG_COOKIE='SECRET99182' -e RABBITMQ_NODENAME=$RABBITNODENAME rabbit-client /bin/bash
