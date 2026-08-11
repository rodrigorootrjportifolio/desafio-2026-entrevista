VERSION=$(shell cat version)
REPO=rodrigorootrjportifolio
PROJETO=flask-desafio-2026-entrevista
TAG=${REPO}/${PROJETO}:${VERSION}
DIR=$(shell pwd -P)
## Flask
build:
	@docker build -t ${TAG} .
run:
	@docker run -it -p 8300:5000 ${TAG}
shell:
	@docker run -it -it -p 8342:5000 --mount type=bind,source=${DIR}/asset/flask/src,target=/app  --entrypoint /bin/sh  ${TAG}
echo:
	@echo ${TAG}	
push:
	@docker push ${TAG}	