from time import gmtime, strftime

from django.contrib import admin
from django.contrib.gis.db import models as gis_models
from django.db import models as django_models

from mapwidgets.widgets import GooglePointFieldWidget

from . import models


class MyDate(admin.widgets.AdminSplitDateTime):

    def __init__(self, attrs=None):
        super().__init__(attrs)

    def value_from_datadict(self, data, files, name):
        value = super().value_from_datadict(data, files, name)
        if not value[1]:
            value[1] = strftime('%H:%M:%S', gmtime())
        return value


class GenericAdmin(admin.ModelAdmin):
    exclude = ('slug',)

    formfield_overrides = {
        django_models.DateTimeField: {'widget': MyDate},
        gis_models.PointField: {"widget": GooglePointFieldWidget(attrs={'autocomplete': 'off'})},
    }


@admin.register(models.Location)
class LocationAdmin(GenericAdmin):
    list_display = ('name', 'address')


@admin.register(models.Organization)
class OrganizationAdmin(GenericAdmin):
    list_display = ('name',)


@admin.register(models.Event)
class EventAdmin(GenericAdmin):
    list_display = ('name', 'organization', 'location', 'start',)
    list_display_links = ('name', 'organization', 'location')


admin.site.register(models.EventLike)
