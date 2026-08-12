VERSION=$(shell cat version)
REPO=rodrigorootrjportifolio
PROJETO=flask-desafio-2026-entrevista
TAG=${REPO}/${PROJETO}:${VERSION}
DIR=$(shell pwd -P)
RELEASE=rodrigorootrjportifolio/flask-desafio-2026-entrevista:4c6e6f3a615ecca7a511b65f0138d7c40ec2d85e
## Flask
build:
	@docker build -t ${TAG} .
run:
	@docker run -it -p 8300:5000 ${TAG}
shell:
	@docker run -it -it -p 8342:5000 --mount type=bind,source=${DIR}/src,target=/app  --entrypoint /bin/sh  ${TAG}
echo:
	@echo ${TAG}	
push:
	@docker push ${TAG}	
shell-release:
	@docker run -it -it -p 8342:5000 --entrypoint /bin/sh  ${RELEASE}	