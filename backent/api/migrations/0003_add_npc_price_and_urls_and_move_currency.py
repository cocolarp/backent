# Generated by Django 2.0.2 on 2018-02-19 21:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0002_auto_20180115_2205'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='event',
            options={'ordering': ['slug']},
        ),
        migrations.AlterModelOptions(
            name='location',
            options={'ordering': ['slug']},
        ),
        migrations.AlterModelOptions(
            name='organization',
            options={'ordering': ['slug']},
        ),
        migrations.RemoveField(
            model_name='organization',
            name='currency',
        ),
        migrations.AddField(
            model_name='event',
            name='currency',
            field=models.CharField(choices=[('EUR', 'Euros (€)'), ('USD', 'US Dollars ($)')], default='EUR', max_length=32),
        ),
        migrations.AddField(
            model_name='event',
            name='event_format',
            field=models.CharField(choices=[('hours', 'A few hours'), ('short', 'A whole day'), ('medium', 'Two to three days'), ('long', 'More than three days')], default='short', max_length=32),
        ),
        migrations.AddField(
            model_name='event',
            name='facebook_event',
            field=models.URLField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='facebook_group',
            field=models.URLField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='facebook_page',
            field=models.URLField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='npc_price',
            field=models.IntegerField(blank=True, help_text="To be expressed in cents of the event's currency", null=True, verbose_name='price (NPC)'),
        ),
        migrations.AddField(
            model_name='event',
            name='npc_signup_page',
            field=models.URLField(blank=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='event',
            name='player_signup_page',
            field=models.URLField(blank=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='event',
            name='end',
            field=models.DateTimeField(blank=True, null=True, verbose_name='end'),
        ),
        migrations.AlterField(
            model_name='event',
            name='price',
            field=models.IntegerField(help_text="To be expressed in cents of the event's currency", verbose_name='price (player)'),
        ),
    ]
