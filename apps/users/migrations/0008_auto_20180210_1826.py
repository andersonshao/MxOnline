# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-02-10 18:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_auto_20180209_1449'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(default='static/images/default.png', upload_to='image/%Y/%m'),
        ),
    ]
