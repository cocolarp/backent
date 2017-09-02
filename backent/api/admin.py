from django.contrib import admin

from . import models


@admin.register(models.Event, models.Location, models.Organization)
class EventAdmin(admin.ModelAdmin):
    exclude = ('slug',)
