FROM --platform=linux/amd64 rust:1-slim-bookworm
LABEL org.opencontainers.image.source="https://github.com/momsdish-corp/public-containers"

ENV PKG_RELEASE=0.4.0

RUN apt-get update && \
    apt-get install -y curl && \
    cargo install htmlq --version "$PKG_RELEASE" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archivesdoc

# Entrypoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 555 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]