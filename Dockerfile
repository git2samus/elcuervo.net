FROM alpine

RUN apk add --update nginx && rm -rf /var/cache/apk/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD _site /www/elcuervo.net/blog

CMD /usr/sbin/nginx -g 'daemon off;'
