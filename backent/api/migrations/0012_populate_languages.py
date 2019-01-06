from django.db import migrations

from backent.api import enums
from backent.api import models


def populate_languages(apps, schema_editor):
    Language = apps.get_model('backent_api', 'Language')
    for lang in enums.LANGUAGE_CHOICES:
        Language.objects.get_or_create(code=lang[0])


def unpopulate_languages(apps, schema_editor):
    Language = apps.get_model('backent_api', 'Language')
    for lang in enums.LANGUAGE_CHOICES:
        Language.objects.filter(code=lang[0]).delete()


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0011_add_languages'),
    ]

    operations = [
        migrations.RunPython(populate_languages, unpopulate_languages),
    ]
