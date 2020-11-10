#!/bin/sh
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { echo "$ $@" 1>&2; "$@" || die "cannot $*"; }
try chown go /var/run/docker.sock
su - go
exec /docker-entrypoint.sh "$@"
