
1. 创建项目
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/lib/python2.7/site-packages/django/bin/django-admin.py startproject dblog

2. 创建app
cd app:
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/git/dblog/manage.py startapp core

3. 检查数据表更新
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/git/dblog/manage.py makemigrations

4. 运行Django命令行工具来自动创建数据库表 初始化表
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/git/dblog/manage.py migrate

5. 创建一个管理员用户
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/git/dblog/manage.py createsuperuser
admin/1qaz@WSX


6. 玩转API
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/git/dblog/manage.py shell

7. 启动
/home/ubuntu/.pythonbrew/venvs/Python-2.7.10/dblog/bin/python  /home/ubuntu/git/dblog/manage.py runserver 0.0.0.0:8080

