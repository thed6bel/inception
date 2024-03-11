FROM alpine:3.18

RUN apk update
RUN apk add --no-cache mariadb mariadb-client

COPY ./tools/scriptmaria.sh /home/scriptmaria.sh
RUN chmod +x /home/scriptmaria.sh

WORKDIR /home

EXPOSE 3306

ENTRYPOINT [ "sh", "scriptmaria.sh" ]