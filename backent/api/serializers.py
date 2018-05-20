from django.contrib.auth import get_user_model

from rest_framework import serializers

from . import models


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
        )


class EventSerializer(serializers.HyperlinkedModelSerializer):
    organization = OrganizationSerializer()
    location = LocationSerializer()

    class Meta:
        model = models.Event
        extra_kwargs = {
            'url': {'lookup_field': 'slug'},
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
            'npc_price',
            'currency',
            'start',
            'event_format',
            'external_url',
            'facebook_event',
            'facebook_page',
            'facebook_group',
            'player_signup_page',
            'npc_signup_page',
        )


class LikedEventSerializer(serializers.RelatedField):

    def to_representation(self, value):
        return value.event.slug


class CurrentUserSerializer(serializers.ModelSerializer):

    events = LikedEventSerializer(many=True, read_only=True, source='likes')

    class Meta:
        model = get_user_model()
        fields = (
            'username',
            'avatar',
            'first_name',
            'last_name',
            'events',
        )
