https://hub.docker.com/ # registry docker pulls from by default though you can build your own registry
images: build-time
containers: run-time. Should run a single application or microservice. Use Linux kernel of host OS
local repository: /var/lib/docker where Docker stores images, containers, and other data
registry: a service that stores Docker images. Docker Hub is the default registry. You can also run your own private registry.
docker images
docker pull redis

fully qualified image name: registry/namespace/image:tag i.e. docker.io/nigelpoulton/ddd-book:ch8.1d
docker pull <repository>:<tag> # pulls an image from official repository
docker pull ghcr.io/regclient/regsync:latest #pull image from different registry; requires DNS name before repository name

docker pull node:latest
docker inspect node:latest # shows metadata about the image
docker images --digests node # shows the digest of the image
docker buildx imagetools inspect nginx:latest # 
docker manifest inspect golang
docker rmi nginx:latest # remove the image named nginx:latest
docker images -q # show only the image IDs of all images
docker rmi $(docker images -q) -f # remove all images