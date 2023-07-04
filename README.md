# virtual-desktop
A Dockerized virtual desktop

## Running the image with Docker compose and noVNC
```yaml
services:
  desktop:
    image: ghcr.io/dtinth/virtual-desktop:main
    privileged: true
    ipc: host
    tmpfs: /tmp:exec
    user: desktop
    hostname: desktop
    environment:
      VNC_GEOMETRY: 1280x800
    volumes:
      - ./shared:/mnt/shared
    ports:
      - 127.0.0.1:5900:5900
  novnc:
    image: geek1011/easy-novnc
    command: -a :5800 -h desktop --no-url-password
    ports:
      - 127.0.0.1:5800:5800
```

## Development
```sh
# Build an image
docker compose build

# Start desktop and noVNC
docker compose up -d

# Restart desktop
docker compose build && docker compose up -d --force-recreate desktop && docker compose logs -f
```
