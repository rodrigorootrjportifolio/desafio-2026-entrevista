VERSION=$(shell cat version)
REPO=rodrigorootrjportifolio
PROJETO=flask-desafio-2026-entrevista
TAG=${REPO}/${PROJETO}:${VERSION}
DIR=$(shell pwd -P)
RELEASE=rodrigorootrjportifolio/flask-desafio-2026-entrevista:8d5a42953df54928cb32c0d78f534bdead9099e1
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