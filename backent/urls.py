from django.conf.urls import include, url

from django.contrib import admin
admin.autodiscover()

from backent.api.views import router
from backent.api.views import CurrentUserView

from .views import signup


urlpatterns = [
    url(r'^api/', include(router.urls)),
    url(r'^profile/$', CurrentUserView.as_view(), name='profile'),
    url(r'^admin/', include(admin.site.urls), name='admin'),
    url(r'^signup/$', signup, name='signup'),
]
