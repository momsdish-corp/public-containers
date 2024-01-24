FROM --platform=linux/amd64 rust:1-slim-bookworm
LABEL org.opencontainers.image.source="https://github.com/momsdish-corp/public-containers"

RUN apt-get update && \
    apt-get install -y curl && \
    cargo install htmlq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archivesdoc