## apache2 配置

1. 修改 /etc/apache2/ports.conf
```
添加一行
Listen 8080
```


2. 配置 /etc/apache2/conf-enabled/dblog.conf

```
WSGIPassAuthorization On
<VirtualHost *:8080>
ServerName dgblog.com
WSGIProcessGroup dgblog.com

WSGIDaemonProcess dgblog.com python-path=/home/python/git/dblog:/home/python/pyenv/versions/django-blog/lib/python2.7/site-packages
WSGIScriptAlias / /home/python/git/dblog/dblog/wsgi.py
ErrorLog "/home/python/log/dblog_err"
CustomLog "/home/python/log/dblog" common

DocumentRoot "/home/python/git/dblog"

Alias /static/ /home/python/git/dblog/static/
<Directory /home/python/git/dblog/dblog>
        Require all granted
</Directory>

<Directory /home/python/git/dblog/dblog>
        <Files wsgi.py>
                #Allow from all
                Require all granted
        </Files>
</Directory>
</VirtualHost>
```