# traefik-localhost

A simple setup to get started with traefik for local use with SSL

## Traefik

Traefik Proxy Documentation: https://doc.traefik.io/traefik/

To download/update the ssl certificates run the updatessl.sh script, the certificates will expire every 60 days

More information on Traefik.me see https://traefik.me

## URLs
|Docker          | URLs                    |
|----------------|-------------------------|
|Traefik         | `https://lb.traefik.me` |
|Grafana         | `https://gr.traefik.me` |
|Jaeger          | `https://ja.traefik.me` |
|Prometheus      | `https://pr.traefik.me` |
|Portainer       | `https://po.traefik.me` |

## First Time Setup
Create a docker network called proxy: `docker network create proxy`

Download the SSL certificates by running `./updatessl.sh`

To bring up: `docker-compose up -d`

To take down: `docker-compose down`

### Portainer
Portainer will require setup, go to `https://po.traefik.me` to begin

### Grafana
Default Login information: admin / password
Password can be changed in `grafana/config.monitoring`

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
include labels for the container to attach to Traefik, replace demo:
```
    labels:
      traefik.enable: true
      traefik.http.routers.demo.rule: Host(`demo.traefik.me`)
      traefik.http.routers.demo.entrypoints: web, websecure
      traefik.http.routers.demo.tls: true
      traefik.http.routers.demo.service: demo
      traefik.http.services.demo.loadbalancer.server.port: 3000
```
Check docker-compose.yml for use
