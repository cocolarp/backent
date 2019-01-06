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
            value[1] = '00:00:00'  # default to 00:00:00
        return value


class GenericAdmin(admin.ModelAdmin):
    exclude = ('slug',)

    formfield_overrides = {
        django_models.DateTimeField: {'widget': MyDate},
        gis_models.PointField: {"widget": GooglePointFieldWidget(attrs={'autocomplete': 'off'})},
    }


@admin.register(models.Location)
class LocationAdmin(GenericAdmin):
    ordering = ('name',)
    list_display = ('name', 'address')
    search_fields = ('name', 'address')


@admin.register(models.Organization)
class OrganizationAdmin(GenericAdmin):
    list_display = ('name',)
    ordering = ('name',)
    search_fields = ('name',)


@admin.register(models.Event)
class EventAdmin(GenericAdmin):
    ordering = ('-start',)
    list_display = ('name', 'organization', 'location', 'start', 'event_format')
    list_display_links = ('name', )
    search_fields = ('name',)
    list_filter = ('event_format', 'created_by',)
    readonly_fields = ('created_by',)
    filter_horizontal = ('tags', 'languages_spoken')
    autocomplete_fields = ('organization', 'location')

    def save_model(self, request, obj, form, change):
        if getattr(obj, 'created_by', None) is None:
            obj.created_by = request.user
        obj.save()


admin.site.register(models.EventLike)
