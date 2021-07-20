# docker-phoenix
A docker environment for setting up phoenix projects

## prerrequisites

- Docker + Docker Compose
- Git

## install

git clone and enter working dir
```
git clone git@github.com:alexserver/docker-phoenix.git
cd docker-phoenix
```

building and starting containers
```
docker-compose up -d
```

entering the phoenix container
```
docker exec -it phoenix bash
```