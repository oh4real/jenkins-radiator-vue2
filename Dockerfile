FROM nginx:alpine

COPY dist /usr/share/nginx/html

COPY site.conf.tpl /etc/nginx/conf.d/default.conf

COPY start.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/start.sh

CMD ["/usr/local/bin/start.sh"]
