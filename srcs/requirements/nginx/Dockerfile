FROM alpine:3.18

RUN apk update && apk upgrade
RUN apk add --no-cache dumb-init openssl nginx

COPY --chmod=755 conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/certs \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/certs/wonlim.key \
	-out /etc/nginx/certs/wonlim.crt \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42/OU=Seoul/CN=wonlim.42.fr"

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["nginx", "-g", "daemon off;"]