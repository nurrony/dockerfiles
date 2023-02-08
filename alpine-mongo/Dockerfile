# Developer: Nur Rony <pro.nmrony@gmail.com>
#
# GitHub:  https://github.com/nurrony
# Twitter: https://twitter.com/nmrony
# Docker:  https://hub.docker.com/u/nmrony

FROM alpine:edge

LABEL maintainer="Nur Rony<pro.nmrony@gmail.com>"

# Optional Configuration Parameter during build
ARG SYSTEM_TZ
ARG MONGO_SERVICE_USER
ARG MONGO_DBPATH
ARG MOGO_PORT
ARG MONGO_ADDITIONAL_PORT
ARG MONOGO_LOGFILE
ARG MONGO_LOGLEVEL
ARG MONGO_VERSION
ARG MONGO_TOOL_VERSION

ENV SYSTEM_TZ=${SYSTEM_TZ:-UTC} \
  MONGO_SERVICE_USER=${MONGO_SERVICE_USER:-mongo} \
  MONGO_DBPATH=${MONGO_DBPATH:-/data/db} \
  MONGO_PORT=${MONGO_PORT:-27017} \
  MONGO_ADDITIONAL_PORT=${MONGO_ADDITIONAL_PORT:-27018-27019} \
  MONGO_LOGFILE=${MONGO_LOGFILE:-/proc/self/fd/1} \
  MONGO_LOGLEVEL=${MONGO_LOGLEVEL:-v} \
  MONGO_VERSION=${MONGO_VERSION:-} \
  MONGO_TOOL_VERSION=${MONGO_TOOL_VERSION:-}

COPY ./entrypoint.sh /usr/local/bin

RUN \
  mkdir -p ${MONGO_DBPATH} $(dirname ${MONGO_LOGFILE}) && \
  adduser -h ${MONGO_DBPATH} -s /sbin/nologin -u 1000 -D ${MONGO_SERVICE_USER} && \
  chown -R ${MONGO_SERVICE_USER}:${MONGO_SERVICE_USER} ${MONGO_DBPATH} && \
  chown -R ${MONGO_SERVICE_USER}:${MONGO_SERVICE_USER} $(dirname ${MONGO_LOGFILE}) && \
  echo http://dl-cdn.alpinelinux.org/alpine/v3.9/main >> /etc/apk/repositories && \
  echo http://dl-cdn.alpinelinux.org/alpine/v3.9/community >> /etc/apk/repositories && \
  echo http://dl-cdn.alpinelinux.org/alpine/v3.8/main >> /etc/apk/repositories && \
  echo http://dl-cdn.alpinelinux.org/alpine/v3.8/community >> /etc/apk/repositories && \
  apk add --no-cache \
  dumb-init \
  mongodb${MONGO_VERSION} \
  mongodb-tools${MONGO_TOOL_VERSION} \
  tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  chmod +x /usr/local/bin/entrypoint.sh && \
  rm -rf /var/cache/apk/* && \
  rm -rf /tmp/* && \
  apk del tzdata

USER    ${MONGO_SERVICE_USER}

WORKDIR ${MONGO_DBPATH}

VOLUME  ${MONGO_DBPATH}

EXPOSE  ${MONGO_PORT} ${MONGO_ADDITIONAL_PORT}

ENTRYPOINT [ "entrypoint.sh" ]
