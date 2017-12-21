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
from django.views.decorators.cache import cache_page
from django.db.models import Q, F

from django.shortcuts import get_object_or_404, redirect, get_list_or_404
from libs.celery.tasks_blog import celery_send_email

from app.blog.models import Tag, Category, Article, BlogComment, Suggest
from app.blog.forms import SuggestForm, BlogCommentForm
from app.blog import tools as cache
from libs.tools import getClientIP

def index(request):
    article_list = Article.objects.filter(status='p')

    tag_list = cache.getTaglist()
    hot_list = cache.getHotlist()
    newart_list = cache.getNewArticlelist()
    newcom_list = cache.getNewCommontlist()
    return render(request, 'blogview/index.html', {
        "article_list": article_list,

        "tag_list": tag_list,
        "hot_list": hot_list,
        "newart_list": newart_list,
        "newcom_list": newcom_list,
    })

def detail(request, article_id):
    tag_list = cache.getTaglist()
    hot_list = cache.getHotlist()
    newcom_list = cache.getNewCommontlist()

    article = Article.objects.get(id=article_id)
    refer_list = Article.objects.filter(status='p', id__in=article.get_refer_ids)
    ip = getClientIP(request)
    if cache.shouldIncrViews(ip):
        article.views = F("views") +1
        article.save()
    return render(request, 'blogview/detail.html', {
        "article": article,
        "refer_list": refer_list,

        "tag_list": tag_list,
        "hot_list": hot_list,
        "newart_list": newcom_list,
    })

def score(request):
    if request.method == "POST":
        art_id = request.POST.get("poid", "0")
        obj = get_object_or_404(Article, pk=art_id)
        obj.likes = F("likes") + 1
        obj.save()
    return HttpResponse(json.dumps({'status': "ok"}), content_type="application/json")

def tag(request, tag_id):
    tag_obj = get_object_or_404(Tag, pk=tag_id)
    article_list = Article.objects.filter(tags=tag_id, status='p')

    tag_list = cache.getTaglist()
    hot_list = cache.getHotlist()
    newart_list = cache.getNewArticlelist()
    newcom_list = cache.getNewCommontlist()
    return render(request, 'blogview/index.html', {
        "tag_name": tag_obj,
        "article_list": article_list,

        "tag_list": tag_list,
        "hot_list": hot_list,
        "newart_list": newart_list,
        "newcom_list": newcom_list,
    })

def search(request):
    search_for = request.GET['search_for']
    if search_for:
        article_list = Article.objects.filter(title__icontains=search_for)

        tag_list = cache.getTaglist()
        hot_list = cache.getHotlist()
        newart_list = cache.getNewArticlelist()
        newcom_list = cache.getNewCommontlist()
        return render(request, 'blogview/index.html', {
            "search_for": search_for,
            "article_list": article_list,

            "tag_list": tag_list,
            "hot_list": hot_list,
            "newart_list": newart_list,
            "newcom_list": newcom_list,
        })
    else:
        return redirect('index')

@cache_page(60*60)
def about(request):
    form = SuggestForm()
    return render(request, 'blogview/about.html', {
        "form": form,
    })