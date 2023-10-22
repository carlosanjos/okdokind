FROM php:8.2-fpm-alpine

# Change the working directory
WORKDIR /var/www

# Add user and group 'laravel' with the desired UID and GID
RUN addgroup -g 1000 laravel && \
    adduser -u 1000 -G laravel -D laravel

USER laravel

# Change the ownership of the Laravel application files to the 'laravel' user
RUN chown -R laravel:laravel /var/www

# Install any required PHP extensions and packages
RUN docker-php-ext-install pdo pdo_mysql

RUN apk add supervisor --no-cache

COPY --chown=laravel:laravel bin/supervisor.conf /etc/supervisord.conf

RUN mkdir /var/log/supervisor && \
    touch /var/log/supervisor/supervisord.log && \
    chown laravel:laravel /var/log/supervisor/supervisord.log

RUN mkdir /var/log/php && \
    touch /var/log/php/errors.log && \
    chown laravel:laravel /var/log/php/errors.log

RUN apk add npm --no-cache

# Copy existing application directory contents
COPY --chown=laravel:laravel bin/run.sh /var/www/bin/run.sh

RUN ["chmod", "+x", "/var/www/bin/run.sh"]

# Start PHP-FPM
ENTRYPOINT ["sh", "/var/www/bin/run.sh"]