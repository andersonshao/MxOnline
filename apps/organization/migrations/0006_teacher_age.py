# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-02-07 19:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0005_teacher_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='age',
            field=models.IntegerField(default=20, verbose_name='年龄'),
        ),
    ]
