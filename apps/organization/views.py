from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from .models import CourseOrg, CityDict, Teacher
from .forms import UserAskForm
from operation.models import UserFavorite
from courses.models import Course
from organization.models import CourseOrg, Teacher


class OrgListView(View):
    def get(self, request):
        all_org = CourseOrg.objects.all()
        all_city = CityDict.objects.all()
        hot_org = all_org.order_by('-click_nums')[:3]

        # 机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_org = all_org.filter(Q(name__icontains=search_keywords)|Q(desc__icontains=search_keywords))

        city_id = request.GET.get('city', '')
        if city_id:
            all_org = all_org.filter(city_id=int(city_id))

        category = request.GET.get('ct', '')
        if category:
            all_org = all_org.filter(category=category)

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                all_org = all_org.order_by('-students')
            elif sort == 'courses':
                all_org = all_org.order_by('-course_nums')

        # 机构列表分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_org, 5, request=request)

        page_obj = p.page(page)

        org_nums = all_org.count()

        return render(request, 'org-list.html', {
            'all_org': page_obj,
            'all_city': all_city,
            'hot_org': hot_org,
            'org_nums': org_nums,
            'city_id': city_id,
            'category': category,
            'sort': sort
        })


class AddUserAskView(View):
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            userask_form.save(commit=True)
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "添加出错"}', content_type='application/json')


class OrgHomeView(View):
    def get(self, request, org_id):
        current_page = 'home'
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        org = CourseOrg.objects.get(id=int(org_id))
        org.click_nums += 1
        org.save()
        all_course = org.course_set.all()
        all_teacher = org.teacher_set.all()
        return render(request, 'org-detail-homepage.html', {
            'org': org,
            'all_course': all_course,
            'all_teacher': all_teacher,
            'current_page': current_page,
            'has_fav': has_fav
        })


class OrgCourseView(View):
    def get(self, request, org_id):
        current_page = 'course'
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        org = CourseOrg.objects.get(id=int(org_id))
        all_course = org.course_set.all()
        return render(request, 'org-detail-course.html', {
            'org': org,
            'all_course': all_course,
            'current_page': current_page,
            'has_fav': has_fav

        })


class OrgDescView(View):
    def get(self, request, org_id):
        current_page = 'desc'
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        org = CourseOrg.objects.get(id=int(org_id))
        return render(request, 'org-detail-desc.html', {
            'org': org,
            'current_page': current_page,
            'has_fav': has_fav

        })


class OrgTeacherView(View):
    def get(self, request, org_id):
        current_page = 'teacher'
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(org_id), fav_type=2):
                has_fav = True
        org = CourseOrg.objects.get(id=int(org_id))
        all_teacher = org.teacher_set.all()
        return render(request, 'org-detail-teachers.html', {
            'org': org,
            'all_teacher': all_teacher,
            'current_page': current_page,
            'has_fav': has_fav

        })


class AddFavView(View):
    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)
        if not request.user.is_authenticated():
            return HttpResponse('{"status": "fail", "msg": "用户未登陆"}', content_type='application/json')
        exist_record = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_record:
            exist_record.delete()

            # 收藏数减1
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_nums -= 1
                if course_org.fav_nums < 0:
                    course_org.fav_nums = 0
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums < 0:
                    teacher.fav_nums = 0
                teacher.save()

            return HttpResponse('{"status": "success", "msg": "收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            user_fav.user = request.user
            user_fav.fav_id = int(fav_id)
            user_fav.fav_type = int(fav_type)
            user_fav.save()

            # 收藏数加1
            if int(fav_type) == 1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums += 1
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_nums += 1
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums += 1
                teacher.save()

            return HttpResponse('{"status": "success", "msg": "已收藏"}', content_type='application/json')


class TeacherListView(View):
    def get(self, request):
        all_teachers = Teacher.objects.all()

        sorted_teachers = all_teachers.order_by('-click_nums')[:3]

        #  授课老师搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords) | Q(points__icontains=search_keywords))

        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'hot':
                all_teachers = all_teachers.order_by('-fav_nums')

        # 讲师列表分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_teachers, 5, request=request)

        page_obj = p.page(page)

        return render(request, 'teachers-list.html', {
            'all_teachers': page_obj,
            'sorted_teachers': sorted_teachers,
            'sort': sort
        })


class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums += 1
        teacher.save()
        sorted_teachers = Teacher.objects.order_by('-click_nums')[:3]
        has_fav_teacher = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(teacher.org.id), fav_type=2):
                has_fav_org = True
            if UserFavorite.objects.filter(user=request.user, fav_id=int(teacher.id), fav_type=3):
                has_fav_teacher = True
        return render(request, 'teacher-detail.html', {
            'teacher': teacher,
            'sorted_teachers': sorted_teachers,
            'has_fav_org': has_fav_org,
            'has_fav_teacher': has_fav_teacher
        })