from django.contrib.auth import get_user_model

from rest_framework.decorators import detail_route
from rest_framework.decorators import permission_classes
from rest_framework import generics
from rest_framework import routers
from rest_framework import status
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
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

    @detail_route(methods=['post'], permission_classes=(IsAuthenticated, ))
    def like(self, request, slug=None):
        event = self.get_object()
        like, created = models.EventLike.objects.get_or_create(
            event=event,
            user=request.user,
        )
        if not created:
            like.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        return Response({}, status=status.HTTP_201_CREATED)


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

    @detail_route(methods=['post'])
    def set_password(self, request, pk=None):
        user = self.get_object()
        serializer = PasswordSerializer(data=request.data)
        if serializer.is_valid():
            user.set_password(serializer.data['password'])
            user.save()
            return Response({'status': 'password set'})
        else:
            return Response(serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST)


router = routers.DefaultRouter()
router.register(r'events', EventViewSet)
router.register(r'locations', LocationViewSet)
router.register(r'organizations', OrganizationViewSet)
