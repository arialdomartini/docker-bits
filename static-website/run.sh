PORT=8085
docker run -d -p=${PORT}:80 --name=my-static-website docker-bits/static-website
docker port my-static-website
echo $(boot2docker ip):${PORT}
