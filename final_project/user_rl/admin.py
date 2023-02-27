from django.contrib import admin
from user_rl.models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
# Register your models here.
class UserModelAdmin(BaseUserAdmin):

    list_display = ('name', 'email', 'is_admin','phone','address','pan_no','designation')
    # list_display = ('id','email', 'name','tc', 'is_admin')
    list_filter = ('is_admin',)
    fieldsets = (
        ('User Credentials', {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('name','phone','address','pan_no','designation')}),
        ('Permissions', {'fields': ('is_admin',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'name', 'password1', 'password2'),
        }),
    )
    search_fields = ('email',)
    ordering = ('email','id')
    filter_horizontal = ()



admin.site.register(User, UserModelAdmin)
# admin.site.register(User)

