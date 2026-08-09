 docker network ls
 docker network inspect bridge
 docker network inspect bridge | grep bridge.name
 brctl show
 ip link show docker0
 docker network inspect host
 docker network inspect none
 docker run -d --name c1 --network localnet alpine sleep 1d
 docker network prune
 docker network create --driver bridge localnet
 docker network rm