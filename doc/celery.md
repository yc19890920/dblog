~/pyenv/versions/django-blog/bin/python manage.py  ~/pyenv/versions/django-blog/bin/celery  worker  -c  4  --loglevel=info

## 启动celery 命令
用supervisor部署即可
执行目录： 
~/git/dblog

执行命令： 开启4个进程
~/pyenv/versions/django-blog/bin/celery  -A  dblog  worker -c  4  --loglevel=info


测试： 发表评论即可收到邮件了。