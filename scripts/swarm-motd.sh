#!/bin/sh
dRunning=$(docker ps -q | wc -l)
dExited=$(docker ps -aq --filter status=exited | wc -l)
dImages=$(docker images -q | wc -l)
dServices=$(docker service ls -q | wc -l)
echo
echo "## DOCKER STATS #################"
echo "#"
echo "# $dRunning container(s) running."
echo "# $dExited container(s) exited."
echo "# $dImages image(s)."
echo "#"
echo "## SWARM #######################"
echo "#"
echo "# $dServices service(s) running."
echo "#"
echo "################################"