# -*- coding: utf-8 -*-

from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    url(r'^admin/', include('app.core.urls')),
    url(r'^admin/set/', include('app.setting.urls')),
    # url(r'^admin/', include(admin.site.urls)),
]
urlpatterns += staticfiles_urlpatterns()

