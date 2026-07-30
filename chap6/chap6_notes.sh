https://hub.docker.com/ # registry docker pulls from by default though you can build your own registry
images: build-time
containers: run-time. Should run a single application or microservice. Use Linux kernel of host OS
local repository: /var/lib/docker where Docker stores images, containers, and other data
registry: a service that stores Docker images. Docker Hub is the default registry. You can also run your own private registry.
docker images
docker pull redis