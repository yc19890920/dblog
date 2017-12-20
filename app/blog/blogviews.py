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


def index(request):
    article_list = Article.objects.filter(status='p')
    return render(request, 'index/index.html', {
        "article_list": article_list,
        "category_list":  Category.objects.all().order_by('name'),
        "tag_list": Tag.objects.all().order_by('name'),
    })


def about(request):
    form = SuggestForm()
    return render(request, 'blogview/about.html', {
        "form": form,
    })