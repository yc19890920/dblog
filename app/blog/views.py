# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import re
import json
from django.shortcuts import render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.template.response import TemplateResponse
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.core.paginator import Paginator, EmptyPage, InvalidPage
from django.db.models import query
from django.conf import settings
from app.blog.models import Tag, Category, Article, BlogComment, Suggest
from app.blog.forms import ArticleForm

############################################################
@login_required
def tag(request):
    if request.method == "POST":
        return add_tag(request, Tag, "admin_tag")
    return render(request, template_name="blog/tag.html", context={
        "model": "tag",
        "model_name": u"标签",
    })

@login_required
def category(request):
    if request.method == "POST":
        return add_tag(request, Category, "admin_category")
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

    # if order_column and int(order_column) < len(colums):
    if isinstance(query, query.QuerySet) and order_column and int(order_column) < len(colums):
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

    count = lists.count()
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
    if request.method == "POST":
        id = request.POST.get('id', "")
        status = request.POST.get('status', "")
        if status == "delete":
            obj = Article.objects.filter(pk=id).first()
            obj.delete()
            messages.add_message(request, messages.SUCCESS, u'删除成功')
            return HttpResponseRedirect(reverse("admin_article"))
    return render(request, template_name="blog/article.html", context={
    })

@login_required
def ajax_article(request):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'title', 'status', 'auth', 'source', 'views', 'likes', 'topped', 'created', 'updated', 'category']
    lists = Article.objects.all()
    if search:
        lists = lists.filter(title__icontains=search)

    if order_column and int(order_column) < len(colums):
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

    count = lists.count()
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
            messages.add_message(request, messages.SUCCESS, u'添加成功')
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
            messages.add_message(request, messages.SUCCESS, u'修改成功')
            return HttpResponseRedirect(reverse("admin_article"))
    return render(request, template_name="blog/article_add.html", context={
        "form": form,
        "is_instance": True,
    })

#
# def gen_rnd_filename():
#     filename_prefix = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
#     return '%s%s' % (filename_prefix, str(random.randrange(1000, 10000)))
#
# @app.route('/ckupload/', methods=['POST'])
# def ckupload():
#     """CKEditor file upload"""
#     error = ''
#     url = ''
#     callback = request.args.get("CKEditorFuncNum")
#     if request.method == 'POST' and 'upload' in request.files:
#         fileobj = request.files['upload']
#         fname, fext = os.path.splitext(fileobj.filename)
#         rnd_name = '%s%s' % (gen_rnd_filename(), fext)
#         filepath = os.path.join(app.static_folder, 'upload', rnd_name)
#         # 检查路径是否存在，不存在则创建
#         dirname = os.path.dirname(filepath)
#         if not os.path.exists(dirname):
#             try:
#                 os.makedirs(dirname)
#             except:
#                 error = 'ERROR_CREATE_DIR'
#         elif not os.access(dirname, os.W_OK):
#             error = 'ERROR_DIR_NOT_WRITEABLE'
#         if not error:
#             fileobj.save(filepath)
#             url = url_for('static', filename='%s/%s' % ('upload', rnd_name))
#     else:
#         error = 'post error'
#     res = """<script type="text/javascript">
#   window.parent.CKEDITOR.tools.callFunction(%s, '%s', '%s');
# </script>""" % (callback, url, error)
#     response = make_response(res)
#     response.headers["Content-Type"] = "text/html"
#     return response

import os
import uuid
from django.utils.encoding import smart_str

@csrf_exempt
@login_required
def ckupload(request):
    callback = request.GET.get("CKEditorFuncNum")
    print '----- request.GET------',  request.GET
    print '----- request.POST------',  request.POST
    if request.method == 'POST' and request.FILES['upload']:
        fileobj = request.FILES['upload']
        # fileobj = request.FILES.get('upload', None)
        content_type = fileobj.content_type
        size = fileobj.size
        print '-------------', content_type
        print '-------------', size
        fname = fileobj.name
        fext = os.path.splitext(fname)[-1]
        print '-------------', fext
        print '-------------', fname
        uuname = '{}{}'.format(str(uuid.uuid1()), fext)
        abspath_uri = "{}ckupload/{}".format(settings.MEDIA_URL, uuname)
        with open(os.path.join(settings.MEDIA_ROOT, 'ckupload', uuname), 'w') as f:
            f.write(fileobj.read())

        res = r"<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+abspath_uri+"', '');</script>"
        return HttpResponse(res)
        # filename = smart_str(fileobj.name)
        # suffix = filename.split('.')[-1]
        print '-------------', content_type
        print '-------------', size
        print '-------------', fname
        print '-------------', fext
    raise Http404()



############################################################
@login_required
def comment(request):
    if request.method == "POST":
        id = request.POST.get('id', "")
        status = request.POST.get('status', "")
        if status == "delete":
            obj = BlogComment.objects.filter(pk=id).first()
            obj.delete()
            messages.add_message(request, messages.SUCCESS, u'删除成功')
            return HttpResponseRedirect(reverse("admin_comment"))
    return render(request, template_name="blog/comment.html", context={
    })

@login_required
def ajax_comment(request):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'username', 'email', 'content', 'created', 'article']
    lists = BlogComment.objects.all()
    if search:
        lists = lists.filter(content__icontains=search)

    if order_column and int(order_column) < len(colums):
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

    count = lists.count()
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
    if request.method == "POST":
        id = request.POST.get('id', "")
        status = request.POST.get('status', "")
        if status == "delete":
            obj = Suggest.objects.filter(pk=id).first()
            obj.delete()
            messages.add_message(request, messages.SUCCESS, u'删除成功')
            return HttpResponseRedirect(reverse("admin_suggest"))
    return render(request, template_name="blog/suggest.html", context={
    })

@login_required
def ajax_suggest(request):
    data = request.GET
    order_column = data.get('order[0][column]', '')
    order_dir = data.get('order[0][dir]', '')
    search = data.get('search[value]', '')
    colums = ['id', 'username', 'email', 'content', 'created']
    lists = Suggest.objects.all()
    if search:
        lists = lists.filter(suggest__icontains=search)

    if order_column and int(order_column) < len(colums):
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

    count = lists.count()
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