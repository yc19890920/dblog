# -*- coding: utf-8 -*-

from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [

    url(r'^core/', include('app.core.urls')),
    url(r'^core/set/', include('app.setting.urls')),
    url(r'^core/blog/', include('app.blog.urls')),
    # url(r'^admin/', include(admin.site.urls)),
]
urlpatterns += staticfiles_urlpatterns()

