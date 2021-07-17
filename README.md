
# Magic Deploy

Helper repository to deploy Magic to a VPS of your chosing.

**Notice** - The `docker-compose.yml` file needs to be manually edited to provide it with your
email address, frontend domain, and backend domain before you invoke the following command.

```
docker-compose up -d
```

The above will start 5 docker containers.

**Notice** - You will also have to manually create the proxy network Docker depends upon
before starting your containers. You can do this with the following command.

```
docker network create nginx-proxy
```
