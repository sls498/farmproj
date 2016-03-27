import json
from django.views.decorators.csrf import ensure_csrf_cookie
from django.shortcuts import render
from django.http import HttpResponse
from django.core import serializers

from .models import Guest

@ensure_csrf_cookie
def guests(request):
    if request.method == 'POST':
        jsonData = json.loads(request.body.decode("utf-8"))
        name = jsonData['name']
        email = jsonData['email']
        remote_addr = request.META['REMOTE_ADDR'] if 'REMOTE_ADDR' in request.META else None
        user_agent = request.META['HTTP_USER_AGENT'] if 'HTTP_USER_AGENT' in request.META else None
        x_real_ip = request.META["HTTP_X_REAL_IP"] if 'HTTP_X_REAL_IP' in request.META else None
        x_forwarded_for = request.META["HTTP_X_FORWARDED_FOR"] if 'HTTP_X_FORWARDED_FOR' in request.META else None
        guest = Guest(name=name, email=email, remote_addr=remote_addr, user_agent=user_agent, x_real_ip=x_real_ip, x_forwarded_for=x_forwarded_for)
        guest.save()
        # return the new guest
        return HttpResponse(serializers.serialize('json', [guest,])[1:-1], content_type='application/json')
    # return all the guests
    return HttpResponse(serializers.serialize('json', Guest.objects.all()), content_type='application/json')

@ensure_csrf_cookie
def index(request):
    return render(request, 'app/index.html')
