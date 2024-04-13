FROM ubuntu:22.04

EXPOSE 80

COPY nginx-net.conf /etc/nginx/sites-available/

RUN set -eux \
    && apt update \
    && apt -y install nginx=1.18.0-6ubuntu14.4 \
    && rm -rf /var/lib/apt/lists/* \
    && ln -sf /var/stdout /var/log/nginx/access.log \
    && ln -sf /var/stdout /var/log/nginx/access.log \
    && ln -s /etc/nginx/sites-available/nginx-net.conf /etc/nginx/sites-enabled/nginx-net.conf \
    && unlink /etc/nginx/sites-enabled/default

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
