# Dockerfile ancestors (php:8.1-fpm is the same as php:8.1-fpm-bullseye):
# PHP Dockerfile: https://github.com/docker-library/php/blob/master/8.1/bullseye/fpm/Dockerfile
# Wordpress Dockerfile: https://github.com/docker-library/wordpress/blob/master/latest/php8.1/fpm/Dockerfile

# To SSH into the original WordPress container:
# `docker run -td --name wordpress wordpress:php8.1-fpm` (opptional suffix: sleep infitite)
# `docker exec -it wordpress bash`

# To build this contaienr and SSH into it
# `docker buildx build -t wordpress:latest --build-arg DOCKERFILE_ROOT=build/<environment> . --file ./build/<environment>/Dockerfile`
# `docker run -td --name wordpress  wordpress:latest`
# `docker exec -it wordpress bash`

# Context
#
# - System - OS packages
# - Scripts - Entrypoint scripts
# - Nginx - Nginx configurations
# - PHP - PHP extensions & configurations
# - WordPress - WordPress configurations & files
# - Environment Variables

FROM docker.io/bitnami/os-shell:12

USER root

RUN install_packages curl unzip git yq jq build-essential ca-certificates

# Install Cargo, requires build-essential (dpkg is outdated)
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y

# Install htmlq
RUN /.cargo/bin/cargo install htmlq && \
    ln -s /.cargo/bin/htmlq /usr/local/bin/htmlq

# Install Skopeo
RUN echo "deb http://deb.debian.org/debian bullseye-backports main" | tee /etc/apt/sources.list.d/backports.list && \
    install_packages skopeo

# Install AWS CLI based on system architecture
RUN VERSION="2.22.35" && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        FILE_SUFFIX="x86_64"; \
    elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then \
        FILE_SUFFIX="aarch64"; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi && \
    rm -rf /tmp/awscli && \
    mkdir -p /tmp/awscli && \
    curl -L "https://awscli.amazonaws.com/awscli-exe-linux-${FILE_SUFFIX}-${VERSION}.zip" -o "/tmp/awscli/awscliv2.zip" && \
    unzip -q /tmp/awscli/awscliv2.zip -d /tmp/awscli && \
    /tmp/awscli/aws/install && \
    rm -rf /tmp/awscli

# Install DevSpace CLI based on system architecture
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        curl -L "https://github.com/loft-sh/devspace/releases/latest/download/devspace-linux-amd64" -o "/tmp/devspace"; \
    elif [ "$ARCH" = "aarch64" ]; then \
        curl -L "https://github.com/loft-sh/devspace/releases/latest/download/devspace-linux-arm64" -o "/tmp/devspace"; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi && \
    install -c -m 0755 /tmp/devspace /usr/local/bin/devspace && \
    rm -rf /tmp/devspace && \
    mkdir -p /opt/bitnami/app/.devspace && \
    chmod 777 /opt/bitnami/app/.devspace

COPY --chown=daemon:root --chmod=755 devspace.yaml /opt/bitnami/app/devspace.yaml

WORKDIR /opt/bitnami/app

# Create a home directory for the user 1001, so that commands like git, devspace, can use it, i.e. for .gitconfig, .devspace
RUN mkdir -p /home/user1001 && \
  chown 1001:1001 /home/user1001 && \
  chmod 775 /home/user1001 && \
  echo "user1001:x:1001:1001::/home/user1001:/bin/false" >> /etc/passwd

# Set the HOME environment variable for user 1001
ENV HOME=/home/user1001

# Running as user 1001, so that the files and folders it creates in /tmp are editable by the wordpress container
USER 1001
