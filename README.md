# virtual-desktop
A Dockerized virtual desktop

```sh
# Build an image
docker compose build

# Start desktop and noVNC
docker compose up -d

# Restart desktop
docker compose build && docker compose up -d --force-recreate desktop && docker compose logs -f
```