from django.conf.urls import include, url

from django.contrib import admin
admin.autodiscover()

from .views import router


urlpatterns = [
    url(r'api/', include(router.urls)),
    url(r'^admin/', include(admin.site.urls)),
]
