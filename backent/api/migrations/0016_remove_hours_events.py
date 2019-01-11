from django.db import migrations
from django.db.models import F

from backent.api import enums
from backent.api import models


def populate_events(apps, schema_editor):
    Event = apps.get_model('backent_api', 'Event')
    Event.objects.filter(
        event_format='hours',
    ).update(
        event_format='short',
    )


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0015_populate_decimal_prices'),
    ]

    operations = [
        migrations.RunPython(populate_events),
    ]
