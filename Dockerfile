FROM nginx:alpine as image
WORKDIR /work

RUN curl -L https://github.com/fluidd-core/fluidd/releases/download/v1.26.0/fluidd.zip -o /usr/share/nginx/html/fluidd.zip \
&& unzip -o /usr/share/nginx/html/fluidd.zip -d /usr/share/nginx/html \
&& rm /usr/share/nginx/html/fluidd.zip

COPY 99-custom-envsubst-on-templates.sh /docker-entrypoint.d/99-custom-envsubst-on-templates.sh
RUN chmod 0755 /docker-entrypoint.d/99-custom-envsubst-on-templates.sh
COPY --chown=101:101 common_variables.conf /etc/nginx/conf.d/common_variables.conf
COPY --chown=101:101 upstream.tmpl /etc/nginx/upstream.tmpl
COPY --chown=101:101 location.tmpl /etc/nginx/location.tmpl
RUN mkdir /etc/nginx/location.d && chown 101:101 /etc/nginx/location.d
COPY --chown=101:101 default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
