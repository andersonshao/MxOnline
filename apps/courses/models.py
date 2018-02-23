from datetime import datetime

from django.db import models
from DjangoUeditor.models import UEditorField

from organization.models import CourseOrg, Teacher


class Course(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name='所属机构', null=True, blank=True)
    teacher = models.ForeignKey(Teacher, verbose_name='讲师', null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name='课程名')
    category = models.CharField(max_length=50, verbose_name='课程类型', default='后端开发')
    tag = models.CharField(max_length=50, verbose_name='课程标签', default='')
    desc = models.CharField(max_length=300, verbose_name='课程描述')
    detail = UEditorField('详情', width=600, height=300, imagePath='courses/ueditor/', filePath='courses/ueditor/', default='', toolbars='mini')
    degree = models.CharField(choices=(('primary', '初级'), ('intermediate', '中级'), ('advanced', '高级')), max_length=20, verbose_name='课程难度')
    learn_times = models.IntegerField(default=0, verbose_name='学习时长')
    students = models.IntegerField(default=0, verbose_name='学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name='收藏人数')
    image = models.ImageField(upload_to='courses/%Y/%m', verbose_name='封面')
    click_nums = models.IntegerField(default=0, verbose_name='点击次数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')
    notice = models.CharField(default='', max_length=300, verbose_name='课程须知')
    teacher_tell = models.CharField(default='', max_length=300, verbose_name='老师告诉你')
    is_banner = models.BooleanField(default=False, verbose_name='是否轮播')
    announcement = models.CharField(default='', max_length=300, verbose_name='公告')

    class Meta:
        verbose_name = '课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_user_course(self):
        return self.usercourse_set.all()[:10]

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a target='_blank' href='http://127.0.0.1:8000/course/detail/{}'> Go </a>".format(self.id))
    go_to.short_description = '跳转详情页'


class BannerCourse(Course):
    class Meta:
        verbose_name = '轮播课程'
        verbose_name_plural = verbose_name
        proxy = True


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程')
    name = models.CharField(max_length=100, verbose_name='章节名')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name='章节名')
    name = models.CharField(max_length=100, verbose_name='视频名')
    url = models.CharField(max_length=500, default='', verbose_name='访问地址')
    learn_times = models.IntegerField(default=0, verbose_name='学习时长')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name='课程')
    name = models.CharField(max_length=100, verbose_name='资源名')
    download = models.FileField(upload_to='course/resource/%Y/%m', verbose_name='下载地址')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '课程资源'
        verbose_name_plural = verbose_name

