# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-02-09 14:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_auto_20180208_1904'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='birthday',
            field=models.DateField(default='1900-1-1', verbose_name='生日'),
        ),
    ]
