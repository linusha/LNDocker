# LNDocker
Docker Environment for Lively-Next.
This is both a lively-next server (port 9011) and a couchdb server (port 5984) running on the same host

# Prerequisites
Docker and Docker-Compose

To install Docker:
  ```
  curl -sSL https://get.docker.com/ | sh
  ```

To install Docker-Compose:
  ```
  curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  ```

# Running
To bring up the docker containers, from the location of the docker-compose.yml file:
```
docker-compose up
```

# Adding files to either server:
## Lively-Next:
Any files in ./lively-server/server/ will be located in /var/www/lively-dev 
## CouchDB:
Any files in ./lively-storage/dbs/ will be located in /var/www/dbs
