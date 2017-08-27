from django.contrib.auth import get_user_model

from rest_framework import routers
from rest_framework import viewsets

from . import models
from .serializers import (
    EventSerializer,
    LocationSerializer,
    OrganizationSerializer,
    UserSerializer,
)


class EventViewSet(viewsets.ModelViewSet):
    queryset = models.Event.objects.all()
    serializer_class = EventSerializer
    lookup_field = 'slug'


class LocationViewSet(viewsets.ModelViewSet):
    queryset = models.Location.objects.all()
    serializer_class = LocationSerializer
    lookup_field = 'slug'


class OrganizationViewSet(viewsets.ModelViewSet):
    queryset = models.Organization.objects.all()
    serializer_class = OrganizationSerializer
    lookup_field = 'slug'


class UserViewSet(viewsets.ModelViewSet):
    queryset = models.User.objects.all()
    serializer_class = UserSerializer


router = routers.DefaultRouter()
router.register(r'events', EventViewSet)
router.register(r'locations', LocationViewSet)
router.register(r'organizations', OrganizationViewSet)
router.register(r'users', UserViewSet)
