# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-02-15 18:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0012_course_is_banner'),
    ]

    operations = [
        migrations.CreateModel(
            name='BannerCourse',
            fields=[
            ],
            options={
                'verbose_name': '轮播课程',
                'verbose_name_plural': '轮播课程',
                'proxy': True,
            },
            bases=('courses.course',),
        ),
        migrations.AddField(
            model_name='course',
            name='announcement',
            field=models.CharField(default='', max_length=300, verbose_name='公告'),
        ),
    ]