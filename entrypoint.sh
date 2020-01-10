#!/usr/bin/env bash

mkdir -p /app/log
python manage.py flush --no-input
python manage.py makemigrations
python manage.py migrate

# supervisord -n -c /app/supervisor.conf
gunicorn -c gconf.conf dblog.wsgi:application