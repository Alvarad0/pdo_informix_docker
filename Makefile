IMAGE  = sbabych/pdo_informix:latest
NAME   = demo
APPDIR = $(shell pwd)/../pdo_informix_app

#RUNOPT ?= --rm -d

all:
	 @echo 'make [create|start|stop|destroy|restart|attach|bash|status]'

create:
	 MOUNT=""; \
	 [ -d '${APPDIR}' ] && MOUNT='--volume=${APPDIR}:/app'; \
	 echo ${APPDIR}; \
	 if ! docker container ls --all | grep -q '${IMAGE}'; then \
	   docker container create -it ${RUNOPT} \
	   --name='${NAME}' \
	   --hostname='${NAME}' \
	   --publish="80:80" \
	   $${MOUNT} ${IMAGE}; \
	 fi

start:   create
	 docker container start '${NAME}'

stop:
	 if docker container ls --all | grep -q '${NAME}'; then \
	   docker container stop '${NAME}'; \
	 fi

destroy: stop
	 if docker container ls --all | grep -q '${NAME}'; then \
	   docker container rm '${NAME}'; \
	 fi

restart: destroy start

attach:  start
	 @echo "Press <Ctrl-P><Ctrl-Q> for detach."
	 docker container attach '${NAME}'; true;

bash:    start
	 @echo "Press <Ctrl-P><Ctrl-Q> for detach."
	 docker container exec -it '${NAME}' bash; true;

status:
	 docker container ls --all --size --no-trunc --filter 'name=${NAME}'
