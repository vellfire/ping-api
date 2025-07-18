# ping-api

Small container to ping a single IP and return the result via API using subprocess and uvicorn

## Usage

Once running, the endpoint is accessible from `http://$ip:8080/status`

Using `docker run`:

```sh
docker run -d \
    --name ping-api \
    --restart unless-stopped \
    --user $(id -u):$(id -g) \
    -e ENDPOINT=192.168.1.1
    -e PORT=8080 \
    -p 8080:8080 \
    ghcr.io/vellfire/ping-api:latest
```

Using `docker compose`:

```yml
---
services:
  ping-api:
    image: ghcr.io/vellfire/ping-api:latest
    restart: unless-stopped
    ports:
      - 8080:8080
    environment:
      PORT: 8080
      ENDPOINT: "192.168.1.1"
```

### Environment Variables

| Name         | Info                              | Default     |
|--------------|-----------------------------------|-------------|
| `PORT`       | Sets webserver port               | `8080`      |
| `ENDPOINT`   | IP address or domain to ping      | `127.0.0.1` |
