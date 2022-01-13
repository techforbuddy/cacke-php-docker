FROM php:8.1.1

WORKDIR /srv

ENV APP_PATH=/srv/myapp
RUN apt update \
    && apt install -y apache2 libicu-dev unzip git \
    && rm -r /var/lib/apt/lists/* \
    && curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer \
    && yes | docker-php-ext-install mysqli pdo pdo_mysql intl opcache \
    && yes | composer create-project --prefer-dist cakephp/app:4.* myapp

COPY .env-app $APP_PATH/config/.env

EXPOSE 8765

CMD /srv/myapp/bin/cake server -H 0.0.0.0 -p 8765

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \ 
   CMD curl -f http://localhost:8765 || exit 1  
