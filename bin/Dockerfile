FROM php:8.2-fpm-alpine

# Change the working directory
WORKDIR /var/www

# Add user and group 'laravel' with the desired UID and GID
#RUN addgroup -g 10001 laravel && \
#    adduser -u 10000 -G laravel -D laravel


# Install any required PHP extensions and packages
RUN docker-php-ext-install pdo pdo_mysql

RUN apk add supervisor npm --no-cache


COPY  bin/supervisor.conf /etc/supervisord.conf

RUN mkdir -p /var/www/storage/logs

# Copy existing application directory contents
COPY  bin/run.sh /var/www/bin/run.sh

#RUN chown -R laravel:laravel /var/www

#USER laravel

RUN ["chmod", "+x", "/var/www/bin/run.sh"]

# Start PHP-FPM
ENTRYPOINT ["sh", "/var/www/bin/run.sh"]