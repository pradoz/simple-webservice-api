FROM golang:latest

RUN mkdir -p /go/src/app && apk update && apk add git

ADD main.go      /go/src/app
ADD config.json  /go/src/app
ADD go.mod       /go/src/app
ADD go.sum       /go/src/app

WORKDIR /go/src/app

# golang cross-compilation stuff
RUN go mod download && CGO_ENABLED=0 GOOS=linux \
    go build -a -installsuffix cgo \
    -ldflags '-extldflags "-static"' \
    -o app .

# create a minimal scratch image
FROM scratch
WORKDIR /app
COPY --from=build-env /go/src/app/app .
COPY --from=build-env /go/src/app/config.json .
ENTRYPOINT ["./app"]
