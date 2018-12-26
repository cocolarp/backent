from django.db import migrations

from backent.api import models


def populate_tags(apps, schema_editor):
    EventTag = apps.get_model('backent_api', 'EventTag')
    EventTag.objects.get_or_create(name=models.EVENT_TAG_BEGINNER_FRIENDLY)
    EventTag.objects.get_or_create(name=models.EVENT_TAG_INTERNATIONAL)
    EventTag.objects.get_or_create(name=models.EVENT_TAG_PWD_FRIENDLY)
    EventTag.objects.get_or_create(name=models.EVENT_TAG_UNDERAGE_FRIENDLY)


def unpopulate_tags(apps, schema_editor):
    EventTag = apps.get_model('backent_api', 'EventTag')
    EventTag.objects.filter(name=models.EVENT_TAG_BEGINNER_FRIENDLY).delete()
    EventTag.objects.filter(name=models.EVENT_TAG_INTERNATIONAL).delete()
    EventTag.objects.filter(name=models.EVENT_TAG_PWD_FRIENDLY).delete()
    EventTag.objects.filter(name=models.EVENT_TAG_UNDERAGE_FRIENDLY).delete()


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0009_add_event_tags'),
    ]

    operations = [
        migrations.RunPython(populate_tags, unpopulate_tags),
    ]
