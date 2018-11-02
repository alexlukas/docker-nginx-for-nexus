FROM nginx:stable-alpine

LABEL maintainer="Alexander Lukas <mail@alex-lukas.de>"

COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /etc/nginx/conf.d
COPY ./conf/nginx/conf.d/nexus-backend.conf /etc/nginx/conf.d/nexus-backend.conf

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/etc/nginx/conf.d", "/var/log/nginx"]

EXPOSE 80

COPY ./docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]