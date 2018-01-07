# -*- coding: utf-8 -*-

from __future__ import absolute_import, unicode_literals

from celery import shared_task, task
from celery.utils.log import get_task_logger

logger = get_task_logger(__name__)

import time

# ignore_result=True, store_errors_even_if_ignored=True  ignore_result 不保存， store_errors_even_if_ignored 错误时保存

@task(ignore_result=True, store_errors_even_if_ignored=True)
def test_celery(x, y):
    # logger.info('func start  ----------------->')
    # logger.info('application:%s', "TEST_APP")
    # logger.info('func end -------------------->')
    print x + y
    return x + y

@task(ignore_result=True, store_errors_even_if_ignored=True)
def test_celery1(x, y, sleep=1):
    time.sleep(sleep)
    res = x+y
    logger.info('test_celery1: {}'.format(res))
    return res

@task(ignore_result=True, store_errors_even_if_ignored=True)
def test_multiply(x, y):
    # logger.info('func start  ----------------->')
    # logger.info('application:%s', "TEST_APP")
    # logger.info('func end -------------------->')
    res = x * y
    logger.info('test_multiply: {}'.format(res))
    return res

from app.core.models import User

@shared_task(ignore_result=True, store_errors_even_if_ignored=True)
def test_user():
    obj = User.objects.first()
    logger.info('username: {}'.format(obj.username))
    return obj.username
