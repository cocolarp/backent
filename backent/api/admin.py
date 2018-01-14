from time import gmtime, strftime

from django.contrib import admin
from django.db import models as django_models

from . import models


class MyDate(admin.widgets.AdminSplitDateTime):

    def __init__(self, attrs=None):
        super().__init__(attrs)

    def value_from_datadict(self, data, files, name):
        value = super().value_from_datadict(data, files, name)
        if not value[1]:
            value[1] = strftime('%H:%M:%S', gmtime())
        return value


@admin.register(models.Event, models.Location, models.Organization)
class EventAdmin(admin.ModelAdmin):
    exclude = ('slug',)

    formfield_overrides = {
        django_models.DateTimeField: {'widget': MyDate},
    }
