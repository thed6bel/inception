FROM alpine:3.18

RUN	apk update && apk upgrade && apk add --no-cache nginx

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]