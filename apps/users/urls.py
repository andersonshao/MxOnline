from django.conf.urls import url

from .views import UserInfoView, ImageUploadView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView, FavCourseView, FavOrgView, FavTeacherView, MyMessageView

urlpatterns = [
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),
    url(r'^image/upload/$', ImageUploadView.as_view(), name='image_upload'),
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name='update_pwd'),
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name='sendemail_code'),
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),
    url(r'^mycourse/$', MyCourseView.as_view(), name='mycourse'),
    url(r'^fav/course/$', FavCourseView.as_view(), name='fav_course'),
    url(r'^fav/org/$', FavOrgView.as_view(), name='fav_org'),
    url(r'^fav/teacher/$', FavTeacherView.as_view(), name='fav_teacher'),
    url(r'^mymessage/$', MyMessageView.as_view(), name='mymessage'),
]