# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django import forms
from app.blog.models import Article, Category
from django.utils.translation import ugettext_lazy as _
from libs.tools import clearHtmlTags

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

    def clean_abstract(self):
        data = self.cleaned_data['abstract']
        if not data:
            data = clearHtmlTags(self.cleaned_data['content'].strip())
        return data

    class Meta:
        model = Article
        fields = ["title", "content",  "status", "abstract", "topped", 'category', 'tags']