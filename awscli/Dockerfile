# Developer: Nur Rony <pro.nmrony@gmail.com>
#
# GitHub:  https://github.com/nurrony
# Twitter: https://twitter.com/nmrony
# Docker:  https://hub.docker.com/u/nmrony

FROM alpine:latest
LABEL maintainer "Nur Rony <pro.nmrony@gmail.com>"

# Optional Configuration Parameter during build
ARG SYSTEM_TZ
ARG DEFAULT_AWS_OUTPUT
ARG DEFAULT_AWS_REGION
ARG DEFAULT_AWS_ACCESS_KEY

ENV SYSTEM_TZ=${SYSTEM_TZ:-UTC} \
  DEFAULT_AWS_OUTPUT=${DEFAULT_AWS_OUTPUT:-json}

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN apk --no-cache add ca-certificates \
	groff \
	tini \
	less \
	python3 && \
	python3 -m ensurepip && \
	rm -r /usr/lib/python*/ensurepip && \
	pip3 install --upgrade pip setuptools && \
	if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
	if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
	rm -r /root/.cache && \
	chmod +x /usr/local/bin/docker-entrypoint.sh && \
	pip install --upgrade awscli awsebcli && \
	mkdir -p /.aws /app \
	&& { \
	echo '[default]'; \
	echo 'output = ${DEFAULT_AWS_OUTPUT}'; \
	echo 'region = $DEFAULT_AWS_REGION'; \
	} > /.aws/config \
	&& { \
	echo '[default]'; \
	echo 'aws_access_key_id = $AWS_ACCESS_KEY_ID'; \
	echo 'aws_secret_access_key = $AWS_SECRET_ACCESS_KEY'; \
	} > /.aws/credentials


WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]
