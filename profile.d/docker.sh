##
# Docker configuration
#
# Copyright 2011-2016 by Andrew Donald Kennedy; All Rights Reserved.
##

docker-toolbox() {
    eval $(docker-machine env default)
    #DOCKER_VM=$(docker-machine ip default)
    #DOCKER_HOST=tcp://${DOCKER_VM}:2376
    #DOCKER_CERT_PATH=~/.docker/machine/machines/default
    #DOCKER_TLS_VERIFY=1
    #export DOCKER_VM DOCKER_HOST DOCKER_CERT_PATH DOCKER_TLS_VERIFY
}

# vim:ts=4:sw=4
