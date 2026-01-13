# use official golang image
FROM golang:1.25.2-alpine

# set work directory
WORKDIR /app

# copy the source code
COPY . .

# download and install the dependencies
RUN go get -d -v ./...

# build the application
RUN go build -o api .

# expose port 8080
EXPOSE 8080

# run the application
CMD ["./api"]


