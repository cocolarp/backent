from django.conf import settings
from django.contrib.gis.db import models as gis_models
from django.db import models
from django.db import IntegrityError
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.text import slugify
from django.utils.translation import ugettext_lazy as _

from django_countries.fields import CountryField
from rest_framework.authtoken.models import Token


CURRENCY_EUR = 'EUR'
CURRENCY_USD = 'USD'

CURRENCY_CHOICES = (
    (CURRENCY_EUR, _("Euros (€)")),
    (CURRENCY_USD, _("US Dollars ($)")),
)


class NameSlugMixin(models.Model):
    slug = models.SlugField(max_length=255, unique=True)
    name = models.CharField(max_length=255)

    class Meta:
        abstract = True

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
    created_by = models.ForeignKey('backent.User', on_delete=models.CASCADE)
    organization = models.ForeignKey('backent_api.Organization', on_delete=models.CASCADE)
    location = models.ForeignKey('backent_api.Location', on_delete=models.CASCADE)
    summary = models.TextField()
    description = models.TextField()
    external_url = models.URLField(max_length=255)
    price = models.IntegerField(help_text="Price in cents of the default currency")
    start = models.DateTimeField(verbose_name=_(u"start"))
    end = models.DateTimeField(verbose_name=_(u"end"))


class Organization(NameSlugMixin):
    currency = models.CharField(
        max_length=32,
        choices=CURRENCY_CHOICES,
        default=CURRENCY_EUR,
    )


class Location(NameSlugMixin):
    address = models.CharField(max_length=255)
    zipcode = models.CharField(max_length=255)
    country = CountryField()
    coords = gis_models.PointField(geography=True, blank=True, null=True)

    def __str__(self):
        return "{0.address}, {0.zipcode}, {0.country}".format(self)


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)
