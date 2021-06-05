## Initial setup
### Get the go module from this repo
`go mod init https://github.com/pradoz/simple-web-service`

### Clone `main.go` into your root directory
`curl -sL https://raw.githubusercontent.com/pradoz/simple-web-service/master/main.go -o main.go`

### This also assumes a Redis instance running on localhost
`export REDIS_PASSWORD=password`
`docker run -d --name redis -p 6379:6379 -e REDIS_PASSWORD=password bitnami/redis:latest`


## TODO:
[x] - Dockerize application  <br />
[ ] - Create deployment  <br />
[ ] - Expose app with Ingress  <br />
[ ] - Configurations using ConfigMap  <br />
[ ] - Secure credentials with Secrets  <br />
[ ] - Use StatefulSet to deploy Redis backend  <br />
[ ] - Adding HTML content (static webpage)  <br />
[ ] - Package Kubernetes cluster with Helm  <br />
