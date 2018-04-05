# Developer: Nur Rony <pro.nmrony@gmail.com>
#
# GitHub:  https://github.com/nmrony
# Twitter: https://twitter.com/nmrony
# Docker:  https://hub.docker.com/u/nmrony

FROM alpine:latest
LABEL maintainer "Nur Rony <pro.nmrony@gmail.com>"
RUN apk --no-cache add 	ca-certificates \
	groff \
	tini \
	less \
	python3 && \
	python3 -m ensurepip && \
	rm -r /usr/lib/python*/ensurepip && \
	pip3 install --upgrade pip setuptools && \
	if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
	if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
	rm -r /root/.cache

RUN pip install --upgrade awscli awsebcli \
	&& mkdir -p /root/.aws \
	&& { \
	echo '[default]'; \
	echo 'output = json'; \
	echo 'region = $AWS_DEFAULT_REGION'; \
	echo 'aws_access_key_id = $AMAZON_ACCESS_KEY_ID'; \
	echo 'aws_secret_access_key = $AMAZON_SECRET_ACCESS_KEY'; \
	} > /root/.aws/config

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["aws"]