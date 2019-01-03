from django.db import migrations

from backent.api import models


def populate_languages(apps, schema_editor):
    Language = apps.get_model('backent_api', 'Language')
    Language.objects.get_or_create(code=models.LANGUAGE_DE)
    Language.objects.get_or_create(code=models.LANGUAGE_EN)
    Language.objects.get_or_create(code=models.LANGUAGE_ES)
    Language.objects.get_or_create(code=models.LANGUAGE_FR)
    Language.objects.get_or_create(code=models.LANGUAGE_IT)
    Language.objects.get_or_create(code=models.LANGUAGE_RU)


def unpopulate_languages(apps, schema_editor):
    Language = apps.get_model('backent_api', 'Language')
    Language.objects.filter(code=models.LANGUAGE_DE).delete()
    Language.objects.filter(code=models.LANGUAGE_FR).delete()
    Language.objects.filter(code=models.LANGUAGE_EN).delete()
    Language.objects.filter(code=models.LANGUAGE_ES).delete()
    Language.objects.filter(code=models.LANGUAGE_IT).delete()
    Language.objects.filter(code=models.LANGUAGE_RU).delete()


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0011_add_languages'),
    ]

    operations = [
        migrations.RunPython(populate_languages, unpopulate_languages),
    ]
