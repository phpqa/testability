#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/testability "$@"
elif [ "$1" = "/vendor/bin/testability" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "testability" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /vendor/bin/testability "$@"
fi

exec "$@"
