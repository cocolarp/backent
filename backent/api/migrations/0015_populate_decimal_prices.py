from django.db import migrations
from django.db.models import F

from backent.api import enums
from backent.api import models


def populate_events(apps, schema_editor):
    Event = apps.get_model('backent_api', 'Event')
    Event.objects.all().update(
        price=F('price') / 100.0,
        npc_price=F('npc_price') / 100.0,
    )


def unpopulate_events(apps, schema_editor):
    Event = apps.get_model('backent_api', 'Event')
    Event.objects.all().update(
        price=F('price') * 100.0,
        npc_price=F('npc_price') * 100.0,
    )


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0014_move_prices_to_decimal_fields'),
    ]

    operations = [
        migrations.RunPython(populate_events, unpopulate_events),
    ]
