FROM --platform=linux/amd64 debian:bookworm-slim
LABEL org.opencontainers.image.source="https://github.com/momsdish-corp/public-containers"

# Dydumper release
ENV PKG_RELEASE=0.15.2-7
ENV LSB_RELEASE=bookworm
ENV ARCH=amd64

WORKDIR /tmp

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y libatomic1 && \
    apt-get install -y libglib2.0-0 && \
    apt-get install -y libpcre3 && \
    apt-get install -y zstd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archivesdoc

# Ref https://github.com/mydumper/mydumper/releases
RUN curl --remote-name --location https://github.com/mydumper/mydumper/releases/download/v${PKG_RELEASE}/mydumper_${PKG_RELEASE}.${LSB_RELEASE}_amd64.deb && \
    dpkg -i mydumper_${PKG_RELEASE}.${LSB_RELEASE}_${ARCH}.deb && \
    rm -rf mydumper_${PKG_RELEASE}.${LSB_RELEASE}_${ARCH}.deb