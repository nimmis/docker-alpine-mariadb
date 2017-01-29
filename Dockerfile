FROM nimmis/alpine-micro

ARG IMAGE_NAME
ARG DOCKER_REPO


# fix labels
LABEL maintainer="nimmis <kjell.havneskold@gmail.com>" \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.name="MariaDB database" \
      org.label-schema.url="https://www.nimmis.nu" \
      org.label-schema.vcs-url="https://github.com/nimmis/docker-alpine-mariadb.git"

COPY root/. /


ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

RUN apk update && apk upgrade && \

    # Make info file about this build
    printf "Build of %s, date: %s\n" $IMAGE_NAME  `date -u +"%Y-%m-%dT%H:%M:%SZ"` > /etc/BUILDS/$DOCKER_REPO && \

    # add mariadb server and client
    apk add mariadb mariadb-client && \

    # clear cache
    rm -rf /var/cache/apk/*

VOLUME /data

