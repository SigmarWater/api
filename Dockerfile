FROM golang:1.25 AS build 
WORKDIR /api 
COPY go.sum go.mod  /api/ 
RUN go mod download  
COPY main.go /api/ 
RUN GOOSE=linux GOARCH=amd64 CGO_ENABLED=0 go build -o service_linux main.go 

FROM alpine:3.22.1 
WORKDIR /api 
COPY --from=build /app/service_linux /api/  
RUN [./service_linux]

