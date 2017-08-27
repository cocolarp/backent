from django.contrib.auth.models import AbstractUser
from django.contrib.gis.db import models as gis_models
from django.db import models
from django.db import IntegrityError
from django.utils.text import slugify
from django.utils.translation import ugettext_lazy as _

from django_countries.fields import CountryField


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



class Event(NameSlugMixin):
    created_by = models.ForeignKey('backent.User')
    organization = models.ForeignKey('backent.Organization')
    location = models.ForeignKey('backent.Location')
    summary = models.TextField()
    description = models.TextField()
    external_url = models.URLField(max_length=255)
    price = models.IntegerField()
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


class User(AbstractUser):
    avatar = models.ImageField(blank=True, null=True)
    location = models.ForeignKey('backent.Location', null=True, blank=True)
