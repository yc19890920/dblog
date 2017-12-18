# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.views.decorators.cache import cache_page
from app.blog import blog_views as views

urlpatterns = [
    url(r'^$', views.index, name='index'),

    # (?P<article_id>\d+)为一个组, 其中?P<article_di>中的article_id代表了该组的组名
    url(r'^article/(?P<article_id>\d+)/$', views.detail, name='detail'),
    url(r"^category/(?P<cate_id>\d+)/$", views.category, name='category'),
    url(r'^article/(?P<article_id>\d+)/comment/$', views.comment, name='comment'),
    url(r'^search/$', views.search, name='search'),
    url(r'^about/$', views.about, name='about'),
    url(r'^tags/(?P<tag_id>\d+)/$', views.tag, name='tag'),
    url(r'^thanks/$', views.thanks, name='thanks')
]