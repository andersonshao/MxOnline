# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-02-04 16:30
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0005_course_tag'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='tag',
            field=models.CharField(default='无', max_length=50, verbose_name='课程标签'),
        ),
    ]
