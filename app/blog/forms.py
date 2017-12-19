# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django import forms
from app.blog.models import Article, Suggest, BlogComment
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
            data = clearHtmlTags(self.cleaned_data['content'].strip())[:54]
        return data

    class Meta:
        model = Article
        fields = ["title", "content",  "status", "abstract", "topped", 'category', 'tags']


class SuggestForm(forms.ModelForm):
    class Meta:
        model = Suggest
        fields = ["content"]

        widgets = {
            'content': forms.Textarea(attrs={
                'placeholder': u'写下你的意见吧~',
                'class': 'form-control',
                'rows': 4,
                'cols': 80,
            })
        }

class BlogCommentForm(forms.ModelForm):
    class Meta:
        model = BlogComment
        fields = ["username", "content"]

        widgets = {
            'username': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': u'请输入昵称',
                'aria-describedby': 'sizing-addon1',
            }),
            'content': forms.Textarea(attrs={
                'placeholder': u'让我来说两句',
                'class': 'form-control',
                'rows': 4,
            }),
        }