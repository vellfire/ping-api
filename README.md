# ping-api

Small container to ping a single IP and return the result via API

## Usage

Currently there is no published image.
This can be used with `docker build`:

```sh
docker build .-t ping-api:1.0.0
docker run -d \
    --name uptime \
    --user $(id -u):$(id -g) \
    -e ENDPOINT=192.168.1.1
    -e PORT=8080 \
    -p 8080:8080 \
    uptime:1.0.0
```

### Environment Variables

| Name         | Info                              | Default     |
|--------------|-----------------------------------|-------------|
| `PORT`       | Sets webserver port               | `8080`      |
| `ENDPOINT`   | IP address or domain to ping      | `127.0.0.1` |
