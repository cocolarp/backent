from django.conf import settings
from django.contrib import messages
from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect
from django.urls import reverse

import requests

from .admin import UserCreationForm


RECAPTCHA_URL = 'https://www.google.com/recaptcha/api/siteverify'


def _get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[-1].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


def _check_recaptcha(request):
    captcha_id = request.POST.get('g-recaptcha-response')
    ret = requests.post(
        RECAPTCHA_URL,
        data={
            'secret': settings.GOOGLE_RECAPTCHA_SECRET_KEY,
            'response': captcha_id,
            'remoteip': _get_client_ip(request),
        },
    )
    return ret.json()['success']


def signup(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            if settings.HAS_RECAPTCHA and not _check_recaptcha(request):
                messages.error(request, 'Invalid reCAPTCHA. Please try again.')
                return render(request, 'signup.html', {'form': form})
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect(reverse('api-root'))
    else:
        form = UserCreationForm()
    return render(request, 'signup.html', {
        'form': form,
        'has_recaptcha': settings.HAS_RECAPTCHA,
    })
