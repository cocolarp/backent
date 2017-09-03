from django.contrib.auth import get_user_model

from rest_framework import generics
from rest_framework import routers
from rest_framework import status
from rest_framework import viewsets
from rest_framework.response import Response

from . import models
from .serializers import (
    CurrentUserSerializer,
    EventSerializer,
    LocationSerializer,
    OrganizationSerializer,
)


class EventViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Event.objects.all()
    serializer_class = EventSerializer
    lookup_field = 'slug'


class LocationViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Location.objects.all()
    serializer_class = LocationSerializer
    lookup_field = 'slug'


class OrganizationViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Organization.objects.all()
    serializer_class = OrganizationSerializer
    lookup_field = 'slug'


class CurrentUserView(generics.RetrieveAPIView):
    serializer_class = CurrentUserSerializer
    queryset = get_user_model().objects.all()

    def retrieve(self, request, *args, **kwargs):
        current_user = request.user
        if current_user.is_anonymous():
            return Response(status=status.HTTP_401_UNAUTHORIZED)
        serializer = self.get_serializer(current_user)
        return Response(serializer.data)


router = routers.DefaultRouter()
router.register(r'events', EventViewSet)
router.register(r'locations', LocationViewSet)
router.register(r'organizations', OrganizationViewSet)
