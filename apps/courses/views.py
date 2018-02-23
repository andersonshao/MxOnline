from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from .models import Course, CourseResource, Video
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixin_utils import LoginRequiredMixin


class CourseListView(View):
    def get(self, request):
        all_course = Course.objects.all()

        hot_course = Course.objects.order_by('-click_nums')[:3]

        #  公开课搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_course = all_course.filter(Q(name__icontains=search_keywords) | Q(tag__icontains=search_keywords)|Q(detail__icontains=search_keywords)|Q(desc__icontains=search_keywords))

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'hot':
                all_course = all_course.order_by('-click_nums')
            elif sort == 'students':
                all_course = all_course.order_by('-students')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_course, 12, request=request)

        page_obj = p.page(page)
        return render(request, 'course-list.html', {
            'all_course': page_obj,
            'sort': sort,
            'hot_course': hot_course
        })


class CourseDetailView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()

        tag = course.tag
        if tag:
            related_course = Course.objects.filter(tag=tag)[:1]
        else:
            related_course = []

        has_fav_course = False
        has_fav_org = False

        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_id), fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course.org.id), fav_type=2):
                has_fav_org = True

        return render(request, 'course-detail.html', {
            'course': course,
            'related_course': related_course,
            'has_fav_course': has_fav_course,
            'has_fav_org': has_fav_org
        })


class CourseInfoView(LoginRequiredMixin, View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resource = CourseResource.objects.filter(course=course)

        # 我要学习功能实现
        if not UserCourse.objects.filter(user=request.user, course=course):
            user_course = UserCourse()
            user_course.user = request.user
            user_course.course = course
            user_course.save()
            course.students += 1
            course.save()

        # 实现 该课的同学还学过
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in user_courses]
        related_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:3]

        return render(request, 'course-video.html', {
            'course': course,
            'all_resource': all_resource,
            'related_courses': related_courses
        })


class CourseCommentView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resource = CourseResource.objects.filter(course=course)
        all_comment = CourseComments.objects.filter(course=course).order_by('-add_time')
        return render(request, 'course-comment.html', {
            'course': course,
            'all_resource': all_resource,
            'all_comment': all_comment
        })


class AddCommentView(View):
    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponse('{"status": "fail", "msg": "用户未登陆"}', content_type='application/json')
        course_id = request.POST.get('course_id', 0)
        comments = request.POST.get('comments', '')
        if int(course_id) > 0 and comments:
            course = Course.objects.get(id=int(course_id))
            course_comments = CourseComments()
            course_comments.course = course
            course_comments.user = request.user
            course_comments.comments = comments
            course_comments.save()
            return HttpResponse('{"status": "success", "msg": "添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "添加失败"}', content_type='application/json')


class VideoPlayView(View):
    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course
        all_resource = CourseResource.objects.filter(course=course)

        UserCourse.objects.get_or_create(user=request.user, course=course)

        # 实现 该课的同学还学过
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user.id for user_course in user_courses]
        user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in user_courses]
        related_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:3]

        return render(request, 'course-play.html', {
            'video': video,
            'course': course,
            'all_resource': all_resource,
            'related_courses': related_courses
        })