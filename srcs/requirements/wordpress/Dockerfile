FROM alpine:3.18

RUN		apk update
RUN		apk upgrade && \
		apk add php81 \
		php81-fpm \
		php81-mysqli \
		php81-phar \
		php81-json \
		php81-mbstring \
		mariadb-client

COPY ./tools/create_user.sh /home/create_user.sh

RUN chmod +x /home/create_user.sh

WORKDIR /home

EXPOSE 9000

ENTRYPOINT ["sh", "create_user.sh"]