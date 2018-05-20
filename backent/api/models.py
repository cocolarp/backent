from django.conf import settings
from django.contrib.gis.db import models as gis_models
from django.db import models
from django.db import IntegrityError
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.text import slugify
from django.utils.translation import ugettext_lazy as _

from rest_framework.authtoken.models import Token


CURRENCY_CHF = 'CHF'
CURRENCY_EUR = 'EUR'
CURRENCY_GBP = 'GBP'
CURRENCY_SEK = 'SEK'
CURRENCY_USD = 'USD'

CURRENCY_CHOICES = (
    (CURRENCY_CHF, _("Swiss Francs (CHF)")),
    (CURRENCY_EUR, _("Euros (€)")),
    (CURRENCY_GBP, _("British pound (£)")),
    (CURRENCY_SEK, _("Swedish Krona (kr)")),
    (CURRENCY_USD, _("US Dollars ($)")),
)

EVENT_FORMAT_HOURS = 'hours'
EVENT_FORMAT_SHORT = 'short'
EVENT_FORMAT_MEDIUM = 'medium'
EVENT_FORMAT_LONG = 'long'

EVENT_FORMAT_CHOICES = (
    (EVENT_FORMAT_HOURS, _("A few hours")),
    (EVENT_FORMAT_SHORT, _("A whole day")),
    (EVENT_FORMAT_MEDIUM, _("Two to three days")),
    (EVENT_FORMAT_LONG, _("More than three days")),
)


class NameSlugMixin(models.Model):
    slug = models.SlugField(max_length=255, unique=True)
    name = models.CharField(max_length=255)

    class Meta:
        abstract = True
        ordering = ['slug']

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        try:
            self.slug = slugify(self.name)
        except IntegrityError:
            self.slug = '{}-1'.format(slugify(self.name))  # FIXME: this is weak.
        super().save(*args, **kwargs)


class EventLike(models.Model):
    event = models.ForeignKey(
        'backent_api.Event',
        related_name='likes',
        on_delete=models.CASCADE
    )
    user = models.ForeignKey(
        'backent.User',
        related_name='likes',
        on_delete=models.CASCADE
    )


class Event(NameSlugMixin):
    slug = models.SlugField(max_length=255)
    created_by = models.ForeignKey('backent.User', on_delete=models.CASCADE)
    organization = models.ForeignKey('backent_api.Organization', on_delete=models.CASCADE)
    location = models.ForeignKey('backent_api.Location', on_delete=models.CASCADE)
    summary = models.TextField()
    description = models.TextField()
    external_url = models.URLField(max_length=255)
    price = models.IntegerField(
        verbose_name=_(u"price (player)"),
        help_text="To be expressed in cents of the event's currency",
    )
    npc_price = models.IntegerField(
        verbose_name=_(u"price (NPC)"),
        help_text="To be expressed in cents of the event's currency",
        blank=True,
        null=True,
    )
    start = models.DateTimeField(verbose_name=_(u"start"))
    event_format = models.CharField(
        max_length=32,
        choices=EVENT_FORMAT_CHOICES,
        default=EVENT_FORMAT_SHORT,
    )
    currency = models.CharField(
        max_length=32,
        choices=CURRENCY_CHOICES,
        default=CURRENCY_EUR,
    )
    facebook_event = models.URLField(max_length=255, blank=True, null=True)
    facebook_page = models.URLField(max_length=255, blank=True, null=True)
    facebook_group = models.URLField(max_length=255, blank=True, null=True)
    player_signup_page = models.URLField(max_length=255, blank=True, null=True)
    npc_signup_page = models.URLField(max_length=255, blank=True, null=True)

    class Meta:
        unique_together = (('name', 'start'),)


class Organization(NameSlugMixin):
    """Register an event's organizer. Except for its name, we don't have much info yet :/
    """
    pass


class Location(NameSlugMixin):
    address = models.CharField(max_length=512)
    coords = gis_models.PointField(geography=True, blank=True, null=True)

    def __str__(self):
        return "{0.name} ({0.address})".format(self)


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
