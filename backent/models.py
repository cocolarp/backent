from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    avatar = models.ImageField(blank=True, null=True)
    location = models.ForeignKey(
        'backent_api.Location',
        null=True, blank=True,
        on_delete=models.SET_NULL
    )
