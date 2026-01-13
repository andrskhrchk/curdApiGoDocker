# CURD API in Go

crud actually

## main.go

Full code was written in one file as this was a test for docker.

## Dockerfile

Created Dockerfile with all instructions

```Dockerfile
    RUN go get -d -v ./...
```

`-d` stands for download only (without a build) `-v` go will print the progress of downloading and processing

```Dockerfile
    RUN go build -o api .
```

`-o` stands for output (filename). We're compiling here a go code.

## docker-compose.yml

A config for a docker to run containers

```yml
services:
  go-app:
    container_name: go-app
    build: .
    environment:
      DATABASE_URL: "host=go_db user=postgres password=postgres dbname=postgres sslmode=disable"
    ports:
      - "8080:8080"
    depends_on:
      - go_db
```

### Instancing a services (containers). Creating go-app container with name `go-app`. Build an image with `buid: .` basically searches for the Dockerfile in the current directory, if Dockerfile doesn't exists command will fail. Exposing ports 8080:8080.

```yml
depends_on: -go_db
```

### That line says that `-go_db` have to be instanced before the `go-app`

```yml
go_db:
container_name: go_db
image: postgres:13
environment:
  - POSTGRES_USER=postgres
  - POSTGRES_PASSWORD=postgres
  - POSTGRES_DB=postgres
ports:
  - "5433:5432"
volumes:
  - pgdata:/var/lib/postgresql/data
```

### Instancing a `go_db` container with name `go_db`. Image used is an official image of postgres. Environment declares user, password and db for postgres db. Port I used were "5433:5432", "5432" was already in use so i changed it for "5433". First port is an outside port and second one is inside port. `volumes` creates a bucket in docker, so if container will be deleted data will remain
