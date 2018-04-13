from random import Random

from django.core.mail import send_mail

from .models import EmailVerifyRecord
from MxOnline.settings import EMAIL_FROM
from MxOnline import celery_app


def random_str(random_length=8):
    s = ''
    char = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    random = Random()
    length = len(char) - 1
    for i in range(random_length):
        s += char[random.randint(0, length)]
    return s


@celery_app.task
def send_register_email(email, send_type='register'):
    code = random_str()
    if send_type == 'sendemail_code':
        code = random_str(4)
    email_record = EmailVerifyRecord()
    email_record.email = email
    email_record.send_type = send_type
    email_record.code = code
    email_record.save()

    if send_type == 'register':
        email_title = '慕学在线网注册激活链接'
        email_body = '请点击下面的链接注册你的账号 https://andersonshao.com/active/{0}'.format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == 'forget':
        email_title = '慕学在线网密码重置链接'
        email_body = '请点击下面的链接重置密码 https://andersonshao.com/reset/{0}'.format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == 'sendemail_code':
        email_title = '慕学在线网修改邮箱'
        email_body = '你的验证码为 {0}'.format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
