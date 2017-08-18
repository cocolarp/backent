from django.conf.urls import include, url

from django.contrib import admin
admin.autodiscover()

import backent.views

urlpatterns = [
    url(r'^$', backent.views.index, name='index'),
    url(r'^db', backent.views.db, name='db'),
    url(r'^admin/', include(admin.site.urls)),
]
