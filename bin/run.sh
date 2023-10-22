#!/bin/sh

cd /var/www

# php artisan migrate:fresh --seed
php artisan cache:clear
php artisan route:cache

# Optimizing Configuration loading
php artisan config:cache
# Optimizing Route loading
php artisan view:cache

#php artisan storage:link

/usr/bin/supervisord -c /etc/supervisord.conf