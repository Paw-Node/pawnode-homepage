
FROM nginx:latest AS runner

COPY html/ /usr/share/nginx/html/

RUN chown -R nginx:nginx /usr/share/nginx/html \
    && find /usr/share/nginx/html -type d -exec chmod 755 {} \; \
    && find /usr/share/nginx/html -type f -exec chmod 644 {} \; \
    && chgrp -R 0 /var/cache/nginx /var/run /etc/nginx/conf.d \
    && chmod -R g+rwX /var/cache/nginx /var/run /etc/nginx/conf.d
