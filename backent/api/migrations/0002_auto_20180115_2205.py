# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2018-01-15 22:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backent_api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='event',
            name='price',
            field=models.IntegerField(help_text='Price in cents of the default currency'),
        ),
    ]
