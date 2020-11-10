FROM gocd/gocd-agent-alpine-3.10:v20.8.0

USER root
RUN apk update
RUN apk add --no-cache --upgrade openjdk11 maven docker-cli
RUN apk add --no-cache --upgrade gradle --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN addgroup -S go && addgroup -S go go
RUN mkdir -p /var/run
RUN touch /var/run/docker.sock
RUN chown go:root /var/run/docker.sock
USER go
