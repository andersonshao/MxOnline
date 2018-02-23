from datetime import datetime

from django.db import models
from django.contrib.auth.models import AbstractUser

from operation.models import UserMessage


class UserProfile(AbstractUser):
    nickname = models.CharField(max_length=50, default='', verbose_name='昵称')
    birthday = models.DateField(default='1900-1-1', verbose_name='生日')
    gender = models.CharField(max_length=10, verbose_name='性别', choices=(('male', '男'), ('female', '女')), default='female')
    mobile = models.CharField(max_length=11, null=True, blank=True)
    address = models.CharField(max_length=100, default='')
    image = models.ImageField(upload_to='image/%Y/%m', default='static/images/default.png')

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username

    def get_unread_nums(self):
        return UserMessage.objects.filter(user__in=[0, self.id], has_read=False).count()


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name='验证码')
    email = models.EmailField(max_length=50, verbose_name='邮箱')
    send_type = models.CharField(choices=(('register', '注册'), ('forget', '忘记密码'), ('update_email', '修改邮箱')), max_length=20, verbose_name='验证类型')
    send_time = models.DateTimeField(default=datetime.now, verbose_name='发送时间')

    class Meta:
        verbose_name = '邮箱验证码'
        verbose_name_plural = verbose_name


class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name='标题')
    image = models.ImageField(upload_to='banner/%Y/%m', verbose_name='轮播图')
    url = models.URLField(max_length=200, verbose_name='访问地址')
    index = models.IntegerField(default=100, verbose_name='顺序')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name
