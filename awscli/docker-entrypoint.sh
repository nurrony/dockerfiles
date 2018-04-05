#!/usr/bin/env sh

isCommand() {
  for cmd in \
    "eb"
  do
    if [ -z "${cmd#"$1"}" ]; then
      return 0
    fi
  done

  return 1
}

# check if the first argument passed is flag of aws cli
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- aws "$@"
# check if any other command supported by image
elif isCommand "$1"; then
    set -- /sbin/tini -- "$@"
else
  # no supported command provided so run awscli by default
  set -- /sbin/tini -- aws "$@"
fi

exec "$@"
