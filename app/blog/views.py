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
from app.blog.forms import ArticleForm

############################################################
@login_required
def tag(request):
    if request.method == "POST":
        add_tag(request, Tag, "admin_tag")
    return render(request, template_name="blog/tag.html", context={
        "model": "tag",
        "model_name": u"标签",
    })

@login_required
def category(request):
    if request.method == "POST":
        add_tag(request, Category, "admin_category")
    return render(request, template_name="blog/tag.html", context={
        "model": "category",
        "model_name": u"分类",
    })

def add_tag(request, model, reverse_name):
    id = request.POST.get('id', "")
    name = request.POST.get('name', "").strip()
    status = request.POST.get('status', "")
    if status == "delete":
        obj = model.objects.filter(pk=id).first()
        obj.delete()
        messages.add_message(request, messages.SUCCESS, u'删除成功')
    if status == "add":
        if not name:
            messages.add_message(request, messages.ERROR, u'输入为空，操作失败')
            return HttpResponseRedirect(reverse(reverse_name))
        if model.objects.filter(name=name).exists():
            messages.add_message(request, messages.ERROR, u'重复添加，添加失败')
        else:
            model.objects.create(name=name)
            messages.add_message(request, messages.SUCCESS, u'添加成功')
    return HttpResponseRedirect(reverse(reverse_name))

@login_required
def ajax_tag(request):
    return ajax_lists(request, Tag)

@login_required
def ajax_category(request):
    return ajax_lists(request, Category)

def ajax_lists(request, model):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'name', 'created', 'updated']
    lists = model.objects.all()
    if search:
        lists = lists.filter(name__icontains=search)

    if lists and order_column and int(order_column) < len(colums):
        if order_dir == 'desc':
            lists = lists.order_by('-%s' % colums[int(order_column)])
        else:
            lists = lists.order_by('%s' % colums[int(order_column)])

    try:
        length = int(data.get('length', 1))
    except ValueError:
        length = 1

    try:
        start_num = int(data.get('start', '0'))
        page = start_num / length + 1
    except ValueError:
        start_num = 0
        page = 1

    count = len(lists)
    if start_num >= count:
        page = 1
    paginator = Paginator(lists, length)
    try:
        lists = paginator.page(page)
    except (EmptyPage, InvalidPage):
        lists = paginator.page(paginator.num_pages)
    rs = {"sEcho": 0, "iTotalRecords": count, "iTotalDisplayRecords": count, "aaData": []}
    re_str = '<td.*?>(.*?)</td>'
    number = length * (page-1) + 1
    for d in lists.object_list:
        t = TemplateResponse(request, 'blog/ajax_tag.html', {'d': d, 'number': number})
        t.render()
        rs["aaData"].append(re.findall(re_str, t.content, re.DOTALL))
        number += 1
    return HttpResponse(json.dumps(rs), content_type="application/json")

############################################################
@login_required
def article(request):
    return render(request, template_name="blog/article.html", context={
    })

@login_required
def ajax_article(request):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'title', 'status', 'views', 'likes', 'topped', 'created', 'updated', 'category']
    lists = Article.objects.all()
    if search:
        lists = lists.filter(title__icontains=search)

    if lists and order_column and int(order_column) < len(colums):
        if order_dir == 'desc':
            lists = lists.order_by('-%s' % colums[int(order_column)])
        else:
            lists = lists.order_by('%s' % colums[int(order_column)])

    try:
        length = int(data.get('length', 1))
    except ValueError:
        length = 1

    try:
        start_num = int(data.get('start', '0'))
        page = start_num / length + 1
    except ValueError:
        start_num = 0
        page = 1

    count = len(lists)
    if start_num >= count:
        page = 1
    paginator = Paginator(lists, length)
    try:
        lists = paginator.page(page)
    except (EmptyPage, InvalidPage):
        lists = paginator.page(paginator.num_pages)
    rs = {"sEcho": 0, "iTotalRecords": count, "iTotalDisplayRecords": count, "aaData": []}
    re_str = '<td.*?>(.*?)</td>'
    number = length * (page-1) + 1
    for d in lists.object_list:
        t = TemplateResponse(request, 'blog/ajax_article.html', {'d': d, 'number': number})
        t.render()
        rs["aaData"].append(re.findall(re_str, t.content, re.DOTALL))
        number += 1
    return HttpResponse(json.dumps(rs), content_type="application/json")

@login_required
def article_add(request):
    form = ArticleForm()
    if request.method == "POST":
        form = ArticleForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse("admin_article"))
    return render(request, template_name="blog/article_add.html", context={
        "form": form,
        "is_instance": False,
    })

@login_required
def article_modify(request, article_id):
    obj = Article.objects.get(pk=article_id)
    form = ArticleForm(instance=obj)
    if request.method == "POST":
        form = ArticleForm(request.POST, instance=obj)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse("admin_article"))
    return render(request, template_name="blog/article_add.html", context={
        "form": form,
        "is_instance": True,
    })

############################################################
@login_required
def comment(request):
    return render(request, template_name="blog/comment.html", context={
    })

@login_required
def ajax_comment(request):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'username', 'content', 'created', 'article']
    lists = BlogComment.objects.all()
    if search:
        lists = lists.filter(content__icontains=search)

    if lists and order_column and int(order_column) < len(colums):
        if order_dir == 'desc':
            lists = lists.order_by('-%s' % colums[int(order_column)])
        else:
            lists = lists.order_by('%s' % colums[int(order_column)])

    try:
        length = int(data.get('length', 1))
    except ValueError:
        length = 1

    try:
        start_num = int(data.get('start', '0'))
        page = start_num / length + 1
    except ValueError:
        start_num = 0
        page = 1

    count = len(lists)
    if start_num >= count:
        page = 1
    paginator = Paginator(lists, length)
    try:
        lists = paginator.page(page)
    except (EmptyPage, InvalidPage):
        lists = paginator.page(paginator.num_pages)
    rs = {"sEcho": 0, "iTotalRecords": count, "iTotalDisplayRecords": count, "aaData": []}
    re_str = '<td.*?>(.*?)</td>'
    number = length * (page-1) + 1
    for d in lists.object_list:
        t = TemplateResponse(request, 'blog/ajax_comment.html', {'d': d, 'number': number})
        t.render()
        rs["aaData"].append(re.findall(re_str, t.content, re.DOTALL))
        number += 1
    return HttpResponse(json.dumps(rs), content_type="application/json")

############################################################
@login_required
def suggest(request):
    return render(request, template_name="blog/suggest.html", context={
    })

@login_required
def ajax_suggest(request):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'content', 'created']
    lists = Suggest.objects.all()
    if search:
        lists = lists.filter(suggest__icontains=search)

    if lists and order_column and int(order_column) < len(colums):
        if order_dir == 'desc':
            lists = lists.order_by('-%s' % colums[int(order_column)])
        else:
            lists = lists.order_by('%s' % colums[int(order_column)])

    try:
        length = int(data.get('length', 1))
    except ValueError:
        length = 1

    try:
        start_num = int(data.get('start', '0'))
        page = start_num / length + 1
    except ValueError:
        start_num = 0
        page = 1

    count = len(lists)
    if start_num >= count:
        page = 1
    paginator = Paginator(lists, length)
    try:
        lists = paginator.page(page)
    except (EmptyPage, InvalidPage):
        lists = paginator.page(paginator.num_pages)
    rs = {"sEcho": 0, "iTotalRecords": count, "iTotalDisplayRecords": count, "aaData": []}
    re_str = '<td.*?>(.*?)</td>'
    number = length * (page-1) + 1
    for d in lists.object_list:
        t = TemplateResponse(request, 'blog/ajax_suggest.html', {'d': d, 'number': number})
        t.render()
        rs["aaData"].append(re.findall(re_str, t.content, re.DOTALL))
        number += 1
    return HttpResponse(json.dumps(rs), content_type="application/json")