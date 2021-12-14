# treafik-localhost

Simple localhost setup with treafik and extras


## URLs
|Docker          |URLs                 |
|----------------|---------------------|
|Traefik         |`http://tr.localhost`|
|Grafana         |`http://gr.localhost`|
|Jaeger          |`http://j.localhost` |
|Prometheus      |`http://pr.localhost`|
|Portainer       |`http://p.localhost` |

## First Time Setup
Create a docker network called proxy: `docker network create proxy`

To bring up: `docker-compose up -d`

To take down: `docker-compose down`

#### Portainer
Portainer will require you to setup up, go to `http://p.localhost` to begin setup

#### Grafana
admin / password
# Config
To attach addition containers to use Traefik include the container on the proxy network.
Also include:
```
...
    networks:
      - proxy
...
networks:
  proxy:
    external: true
```
include labels for the container to attach to Traefik, replace dem:
```
    labels:
      traefik.enable: true
      traefik.http.routers.dem.rule: Host(`dem.localhost`)
      traefik.http.routers.dem.entrypoints: web
      traefik.http.routers.dem.service: dem
      traefik.http.services.dem.loadbalancer.server.port: 3000
```
see docker-compose.yml for use