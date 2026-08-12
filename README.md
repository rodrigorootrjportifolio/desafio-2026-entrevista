# desafio-2026-entrevista PRINCIPAL
Desafio Agosto de 2026, entrevista.

Existe, além desta app uma outra no repo:
    - https://github.com/rodrigorootrjportifolio/desafio-2026-entrevista-ext-sinatra
github/workflow:
    - .github/workflows/docker-build.yaml
registry:
    - https://hub.docker.com/repository/docker/rodrigorootrjportifolio/flask-desafio-2026-entrevista-dev/general
    - https://hub.docker.com/repository/docker/rodrigorootrjportifolio/sinatra-desafio-2026-entrevista-dev/general

# Diagrama
run
```sh
make build
make run
```


pipeline:
    envroment: development
    variaveis:
        -  FLASK_LOCAL_CACHE_DEFAULT_TIMEOUT
- development    
Pipeline:
CI

```sh
/estatico GET
/timer    GET
/metrics  GET
```
##
Sinatra:
 - https://github.com/rodrigorootrjportifolio/desafio-2026-entrevista-ext-sinatra

## 
TODO:
    spec driven development:
    policy de retenção de dados
    SRE de requisições
    Log Monitoring
    Sonar
    Sec