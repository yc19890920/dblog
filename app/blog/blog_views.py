# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import re
import json
from django.shortcuts import render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required
from django.template.response import TemplateResponse
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.core.paginator import Paginator, EmptyPage, InvalidPage
from app.blog.models import Tag, Category, Article, BlogComment, Suggest
from django.views.decorators.cache import cache_page
from django.db.models import Q

from app.blog.forms import SuggestForm, BlogCommentForm
from django.shortcuts import get_object_or_404, redirect, get_list_or_404

from libs.celery.tasks_blog import celery_send_email

import logging
logger = logging.getLogger(__name__)

def index(request):
    article_list = Article.objects.filter(status='p')
    return render(request, 'index/index.html', {
        "article_list": article_list,
        "category_list":  Category.objects.all().order_by('name'),
        "tag_list": Tag.objects.all().order_by('name'),
    })

@cache_page(60 * 15)
def detail(request, article_id):
    article = Article.objects.get(id=article_id)

    article.views += 1
    article.save()

    form = BlogCommentForm()
    return render(request, 'index/detail.html', {
        "article": article,
        'form': form,
        "category_list":  Category.objects.all().order_by('name'),
        "tag_list": Tag.objects.all().order_by('name'),
    })


@cache_page(60 * 15)
def category(request, cate_id):
    article_list = Article.objects.filter(category=cate_id, status='p')
    cate_obj = get_object_or_404(Category, pk=cate_id)
    return render(request, 'index/index.html', {
        "cate_name": cate_obj,
        "article_list": article_list,
        "category_list":  Category.objects.all().order_by('name'),
        "tag_list": Tag.objects.all().order_by('name'),
    })


@cache_page(60 * 15)
def tag(request, tag_id):
    article_list = Article.objects.filter(tags=tag_id, status='p')
    tag_obj = get_object_or_404(Tag, pk=tag_id)
    return render(request, 'index/index.html', {
        "tag_name": tag_obj,
        "article_list": article_list,
        "category_list":  Category.objects.all().order_by('name'),
        "tag_list": Tag.objects.all().order_by('name'),
    })

def search(request):
    search_for = request.GET['search_for']

    if search_for:
        results = Article.objects.filter(title__icontains=search_for)
        # results = Article.objects.filter( Q(title__icontains=search_for) | Q(category__name__icontains=search_for) )
        # category_list = get_list_or_404(Category)
        # article_list = get_list_or_404(Article)
        category_list = Category.objects.all().order_by('name')
        tag_list = Tag.objects.all().order_by('name')
        return render(request, 'index/search.html', {
            'article_list': results,
            'category_list': category_list,
            'tag_list': tag_list
        })
    else:
        return redirect('index')

def comment(request, article_id):
    if request.method == 'POST':
        form = BlogCommentForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            content = form.cleaned_data['content']
            article = get_object_or_404(Article, pk=article_id)
            new_record = BlogComment(username=username, content=content, article=article)
            new_record.save()
            return redirect('detail', article_id=article_id)


@cache_page(60 * 30)
def about(request):
    form = SuggestForm()
    if request.method == 'POST':
        form = SuggestForm(request.POST)
        if form.is_valid():
            content = form.cleaned_data['content']
            o = Suggest(content=content)
            o.save()
            try:
                # 使用celery并发处理邮件发送的任务
                celery_send_email.delay(u'访客意见', content, ['1793302800@qq.com'])
            except Exception as e:
                # print '------------222222----'
                logger.error(u"邮件发送失败: {}".format(e))
            # print '------------111---------'
            return redirect('thanks')
    return render(request, 'index/about.html', {
        'form': form
    })


def thanks(request):
    return render(request, 'index/thanks.html')
