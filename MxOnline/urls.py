"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
import xadmin
from django.views.static import serve
from MxOnline.settings import MEDIA_ROOT

from users.views import LoginView, RegisterView, ActiveUserView, ForgetPwdView, ResetPwdView, ModifyPwdView, LogoutView, IndexView

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^register/$', RegisterView.as_view(), name='register'),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^ueditor/', include('DjangoUeditor.urls')),
    url(r'^active/(?P<active_code>.*)/$', ActiveUserView.as_view(), name='user_active'),
    url(r'^reset/(?P<active_code>.*)/$', ResetPwdView.as_view(), name='reset_pwd'),
    url(r'^forget/$', ForgetPwdView.as_view(), name='forget_pwd'),
    url(r'^modify_pwd/$', ModifyPwdView.as_view(), name='modify_pwd'),

    # 课程机构的url配置
    url(r'^org/', include('organization.urls', namespace='organization')),

    # 课程的url配置
    url(r'^course/', include('courses.urls', namespace='course')),

    # 用户信息的url配置
    url(r'^user/', include('users.urls', namespace='user')),

    # 配置上传文件的访问路由
    url(r'media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),

    # url(r'static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),

    url(r'ueditor', include('DjangoUeditor.urls'))

]

handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'
