from django.test import TestCase

from . import models


class NameSlugMixinTestCase(TestCase):

    def test_slug_is_updated(self):
        slug_model = models.Organization.objects.create(name="Hello World")
        self.assertEqual(slug_model.slug, 'hello-world')
