# -*- coding: utf-8 -*-
from __future__ import absolute_import, unicode_literals

# celery 定时任务
from datetime import timedelta
from celery.schedules import crontab
CELERYBEAT_SCHEDULE = {
    # 'add-every-60-seconds': {
    #     'task': 'app.core.tasks.test_celery',
    #     'schedule': timedelta(minutes=1),
    #     'args': (15, 15)
    # },

    'add-every-15-minuters': {
        'task': 'app.core.tasks.test_user',
        'schedule': timedelta(minutes=15),
        # 'args': ()
    },

    # 'timing': {
    #     'task': 'app.core.tasks.test_multiply',
    #     'schedule': crontab(minute=u'15', hour=u'16',),
    #     # 'schedule': crontab(minute=u'40', hour=u'17',),
    #     # "schedule": 3600, #every hour
    #     # 'schedule': timedelta(seconds=3),
    #     'args': (2, 3)
    # },




    # #################################################################
    # "add-every-0-seconds": {
    #     "task": "app.core.tasks.test_celery1",
    #     "schedule": timedelta(seconds=1),
    #     "args": (16, 17, 1)
    # },
    #
    # "add-every-1-seconds": {
    #     "task": "app.core.tasks.test_celery1",
    #     "schedule": timedelta(seconds=1),
    #     "args": (16, 17, 0)
    # },
    #
    # "add-every-2-seconds": {
    #     "task": "app.core.tasks.test_celery1",
    #     "schedule": timedelta(seconds=1),
    #     "args": (16, 17, 1)
    # },
    #
    # "add-every-3-seconds": {
    #     "task": "app.core.tasks.test_celery1",
    #     "schedule": timedelta(seconds=1),
    #     "args": (16, 17, 0)
    # },
    #
    # "add-every-4-seconds": {
    #     "task": "app.core.tasks.test_celery1",
    #     "schedule": timedelta(seconds=1),
    #     "args": (16, 17, 1)
    # },
    #
    # "add-every-5-seconds": {
    #     "task": "app.core.tasks.test_celery1",
    #     "schedule": timedelta(seconds=1),
    #     "args": (16, 17, 0)
    # },

}


# import random
# for i in xrange(200):
#     print '''
# "add-every-%d-seconds": {
# "task": "app.core.tasks.test_celery1",
# "schedule": timedelta(seconds=10),
# "args": (16, 17, %d)
# },''' % (i, random.randint(1, 10))
