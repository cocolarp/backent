from django.contrib.auth import get_user_model

from rest_framework import serializers

from . import models


class EventSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Event
        extra_kwargs = {
            'url': {'lookup_field': 'slug'},
            'location': {'lookup_field': 'slug'},
            'organization': {'lookup_field': 'slug'},
        }
        fields = (
            'url',
            'slug',
            'name',
            'organization',
            'location',
            'summary',
            'description',
            'price',
            'start',
            'end',
            'external_url',
        )


class LocationSerializer(serializers.HyperlinkedModelSerializer):
    longitude = serializers.FloatField(source='coords.x')
    latitude = serializers.FloatField(source='coords.y')

    class Meta:
        model = models.Location
        extra_kwargs = {'url': {'lookup_field': 'slug'}}
        fields = (
            'url',
            'slug',
            'name',
            'address',
            'zipcode',
            'country',
            'latitude',
            'longitude',
        )


class OrganizationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.Organization
        extra_kwargs = {'url': {'lookup_field': 'slug'}}
        fields = (
            'url',
            'slug',
            'name',
            'currency'
        )


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = models.User
        fields = (
            'url',
            'avatar',
            'username',
            'location',
        )
