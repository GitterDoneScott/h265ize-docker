FROM node:7-alpine
MAINTAINER gitterdonescott

LABEL h265ize_version="bleading edge" architecture="amd64"

RUN apk add --no-cache --update-cache git ffmpeg && \
    npm install FallingSnow/h265ize --global --no-optional && \
    apk del git && \
    mkdir /input && mkdir /output && \
    rm /var/cache/apk/*

#override for single file. [TODO] Spaces in filename break
ENV SOURCE_FILE "" 

VOLUME ["/input", "/output"]
WORKDIR /h265ize

#mount the same directory twice for source and destination to be the same
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/local/bin/h265ize /input/$SOURCE_FILE -d /output $0 $@"]
