from django.contrib.auth.models import AnonymousUser
from django.test import TestCase, RequestFactory

class SimpleTest(TestCase):
    def setUp(self):
        self.factory = RequestFactory()

    def test_details(self):
        request = self.factory.get('/')
        request.user = AnonymousUser()
