from .models import Course, Lesson, Video, CourseResource, BannerCourse

import xadmin


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'org', 'category', 'tag', 'teacher', 'detail', 'go_to']
    list_editable = ['name', 'degree', 'desc', 'is_banner']
    search_fields = ['name', 'desc', 'detail', 'tag']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums', 'add_time']
    ordering = ['-click_nums']
    readonly_fields = ['fav_nums']
    model_icon = 'fa fa-bitbucket'
    inlines = [LessonInline, CourseResourceInline]
    refresh_times = [3, 5]
    style_fields = {'detail': 'ueditor'}

    def queryset(self):
        return super(CourseAdmin, self).queryset().filter(is_banner=False)

    def save_models(self):
        obj = self.new_obj
        obj.save()
        org = obj.org
        if org is not None:
            org.course_nums = Course.objects.filter(org=org).count()
            org.save()


class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'degree', 'org', 'category', 'tag', 'teacher', 'detail', 'go_to']
    list_editable = ['name', 'degree', 'desc', 'is_banner']
    search_fields = ['name', 'desc', 'detail', 'tag']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students', 'fav_nums', 'click_nums', 'add_time']
    ordering = ['-click_nums']
    readonly_fields = ['fav_nums']
    model_icon = 'fa fa-bitbucket'
    inlines = [LessonInline, CourseResourceInline]
    refresh_times = [3, 5]
    style_fields = {'detail': 'ueditor'}

    def queryset(self):
        return super(BannerCourseAdmin, self).queryset().filter(is_banner=True)


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']
    model_icon = 'fa fa-paperclip'


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time', 'url']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']
    model_icon = 'fa fa-video-camera'


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['lesson', 'name', 'download']
    list_filter = ['course', 'name', 'download', 'add_time']
    model_icon = 'fa fa-youtube'


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(BannerCourse, BannerCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)


