from django.contrib import admin

from .models import Guest
# Register your models here.

class GuestAdmin(admin.ModelAdmin):
    fieldsets = [
                 (None,                     {'fields': ['name', 'email']}),
                 ('Private Info',    {'fields': ['x_real_ip', 'x_forwarded_for', 'remote_addr', 'user_agent'], 'classes': ['collapse']}),
    ]
    list_display = ('name', 'email')
    search_fields = ('name',)
    ordering = ('name',)
    
admin.site.register(Guest, GuestAdmin)