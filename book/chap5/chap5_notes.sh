docker run -d --name ctr1 nginx
docker ps
docker ps -a
docker rm ctr1 -f

/usr/bin/dockerd # the docker daemon
/usr/bin/docker # the docker client
/usr/bin/docker-init # the docker init binary
/usr/bin/containerd # the containerd daemon
/usr/bin/docker-containerd # the containerd daemon
/usr/bin/docker-containerd-shim # the containerd shim
/usr/bin/runc # the runc binary