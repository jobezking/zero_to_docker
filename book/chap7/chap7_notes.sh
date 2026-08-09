sudo systemctl status docker.service
docker run <arguments> <image> <command>
There are three ways you can tell Docker how to start an app in a container: 
    An Entrypoint instruction in the image 
    A Cmd instruction in the image 
    A CLI argument
docker run -d --name apache-server -p 8080:80 httpd:latest  # run a container in detached mode, name it apache-server, 
                                                            # map port 8080 on host to port 80 in container, use the httpd:latest image
docker run --rm -d alpine sleep 60 #
docker images # list all images on the host
docker ps # list all running containers
docker ps -a # list all containers

docker exec -it webserver sh
docker exec <container> <command>
docker exec apache-server ls  # sends ls command to apache-server container
docker inspect apache-server
docker stop apache-server
docker restart apache-server

docker rm webserver -f
docker ps -a