from .models import CityDict, Teacher, CourseOrg

import xadmin


class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']
    model_icon = 'fa fa-building-o'


class TeacherAdmin(object):
    list_display = ['name', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fav_nums', 'add_time', 'org', 'image']
    search_fields = ['org', 'name', 'work_years', 'work_company', 'work_position', 'points']
    list_filter = ['org__name', 'name', 'work_years', 'work_company', 'work_position', 'points', 'click_nums', 'fav_nums', 'add_time']
    model_icon = 'fa fa-smile-o'


class CourseOrgAdmin(object):
    list_display = ['name', 'desc', 'category', 'address', 'course_nums','add_time']
    search_fields = ['name', 'desc', 'category', 'address', 'city']
    list_filter = ['name', 'desc', 'category', 'address', 'city__name', 'click_nums', 'fav_nums', 'add_time']
    model_icon = 'fa fa-rocket'


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
