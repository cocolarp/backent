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


@admin.register(models.Location, models.Organization)
class GenericAdmin(admin.ModelAdmin):
    exclude = ('slug',)

    formfield_overrides = {
        django_models.DateTimeField: {'widget': MyDate},
    }


@admin.register(models.Event)
class EventAdmin(GenericAdmin):
    list_display = ('name', 'location_name', 'start',)

    def location_name(self, obj):
        return obj.location.name

    location_name.admin_order_field  = 'location__name'


admin.site.register(models.EventLike)
