#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/testability "$@"
elif [ "$1" = "/composer/vendor/bin/testability" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "testability" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/testability "$@"
fi

exec "$@"
