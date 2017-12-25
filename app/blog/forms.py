# -*- coding: utf-8 -*-

from __future__ import unicode_literals

import re
import json
from django import forms
from app.blog.models import Article, Suggest, BlogComment, CKeditorPictureFile
from django.utils.translation import ugettext_lazy as _
from libs.tools import clearHtmlTags

P = re.compile('^(\w|[-+=.])+@\w+([-.]\w+)*\.(\w+)$')
PicP = re.compile(ur'src="(\/media\/ckupload\/.*?)"')

class ArticleForm(forms.ModelForm):

    def clean_title(self):
        data = self.cleaned_data['title'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写标题"))
        return data

    def clean_content(self):
        data = self.cleaned_data['content'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写正文"))
        return data

    def clean_auth(self):
        data = self.cleaned_data['auth'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写作者"))
        return data

    def clean_abstract(self):
        data = self.cleaned_data['abstract'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写摘要"))
        return data

    def referPicture(self, obj):
        article_id = obj.id
        abstract = self.cleaned_data['abstract']
        content = self.cleaned_data['content']
        lists = PicP.findall(content)
        lists2 = PicP.findall(abstract)
        l = list( set(lists) | set(lists2) )
        CKeditorPictureFile.objects.filter(article_id=article_id).update(article_id=0)
        for i in l:
            objpic = CKeditorPictureFile.objects.filter(filepath=i).first()
            objpic.article_id = article_id
            objpic.save()

    class Meta:
        model = Article
        fields = ["title", "content",  "abstract", 'auth',  'source', "status", "topped", 'category', 'tags']


class SuggestForm(forms.ModelForm):

    def clean_username(self):
        data = self.cleaned_data['username'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写您的姓名"))
        return data

    def clean_content(self):
        data = self.cleaned_data['content'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写您的留言"))
        return data

    def clean_email(self):
        data = self.cleaned_data['email'].strip()
        if not  P.match(data):
            raise forms.ValidationError(_(u"请填写正确的邮箱"))
        return data

    class Meta:
        model = Suggest
        fields = ["username", "email", "content"]

        # widgets = {
        #     'content': forms.Textarea(attrs={
        #         'placeholder': u'写下你的意见吧~',
        #         'class': 'form-control',
        #         'rows': 4,
        #         'cols': 80,
        #     })
        # }

    @property
    def customer_errors(self):
        # {"username": [{"message": "This field is required.", "code": "required"}],
        #  "content": [{"message": "This field is required.", "code": "required"}],
        # "email": [{"message": "This field is required.", "code": "required"}]}
        errors = self.errors.as_json(escape_html=False)
        if isinstance(errors, (str, basestring)):
            return json.loads(errors)
        return errors

    def get_error(self, field):
        errors = self.customer_errors
        if field in errors:
            return errors[field][0]["message"]
        return None

    @property
    def username_err(self):
        return self.get_error("username")

    @property
    def email_err(self):
        return self.get_error("email")

    @property
    def content_err(self):
        return self.get_error("content")

class BlogCommentForm(forms.ModelForm):

    article = forms.CharField(label=_(u'文章'), required=False, widget=forms.HiddenInput())

    def __init__(self, article, *args, **kwargs):
        super(BlogCommentForm, self).__init__(*args, **kwargs)
        self.article = article

    def clean_article(self):
        return self.article

    def clean_username(self):
        data = self.cleaned_data['username'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写您的姓名"))
        return data

    def clean_content(self):
        data = self.cleaned_data['content'].strip()
        if not data:
            raise forms.ValidationError(_(u"请填写您的留言"))
        return data

    def clean_email(self):
        data = self.cleaned_data['email'].strip()
        if not  P.match(data):
            raise forms.ValidationError(_(u"请填写正确的邮箱"))
        return data

    class Meta:
        model = BlogComment
        fields = ["article", "username", "email", "content"]

    @property
    def customer_errors(self):
        errors = self.errors.as_json(escape_html=False)
        if isinstance(errors, (str, basestring)):
            return json.loads(errors)
        return errors

    def get_error(self, field):
        errors = self.customer_errors
        if field in errors:
            return errors[field][0]["message"]
        return None

    @property
    def username_err(self):
        return self.get_error("username")

    @property
    def email_err(self):
        return self.get_error("email")

    @property
    def content_err(self):
        return self.get_error("content")
