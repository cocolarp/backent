#!/usr/bin/env python3

import argparse
import csv
import json
import os

import django
from django.contrib.gis.geos import Point

from models import Place

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backent.settings')
os.environ.setdefault('SECRET_KEY', 'caca')

django.setup()

from backent.api.models import Location, Organization


def read_csv_data(filename):
    with open(filename, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        return [row for row in reader]


def read_json_data(filename):
    with open(filename) as f:
        return [json.loads(line) for line in f]


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Inject JSON processed complete data into the SQL database.')
    parser.add_argument('places_filename', metavar='PLACES_FILENAME', help='the input places filename')
    parser.add_argument('organizations_filename', metavar='ORGANIZATIONS_FILENAME', help='the input places filename')
    args = parser.parse_args()

    places = [Place(**dct) for dct in read_json_data(args.places_filename)]
    Location.objects.all().delete()
    for place in places:
        try:
            Location.objects.create(name=place.name, address=place.address, coords=Point(place.lng, place.lat))
        except django.db.utils.IntegrityError as exc:
            print(">>>> ERROR: location '{}' already exists".format(place.name))

    Organization.objects.all().delete()
    for org in read_csv_data(args.organizations_filename):
        try:
            Organization.objects.create(name=org[0])
        except django.db.utils.IntegrityError as exc:
            print(">>>> ERROR: organization '{}' already exists".format(org[0]))
