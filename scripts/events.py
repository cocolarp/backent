#!/usr/bin/env python3

import argparse
import csv
import os

from fuzzywuzzy import fuzz
import django


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backent.settings')
os.environ.setdefault('SECRET_KEY', 'caca')
os.environ.setdefault('ENVIRONMENT', 'dev')

django.setup()

from models import Event as CsvEvent

from backent.models import User
from backent.api.models import Location, Organization, Event


all_locations = Location.objects.values('pk', 'address')
all_organizations = Organization.objects.values('pk', 'name')


def read_csv_data(filename):
    with open(filename, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        return [row for row in reader]


def get_location(event):
    scores = [fuzz.token_set_ratio(event.place, loc['address']) for loc in all_locations]
    locations = sorted(zip(scores, all_locations), key=lambda d: d[0], reverse=True)
    best_score, location_guess = locations[0]
    if best_score != 100:
        print(">>>>> WARN: no location match for event '{}' and location '{}'".format(
            event.name, event.place,
        ))
        default_loc, _ = Location.objects.get_or_create(
            name='COCOLARP_IMPORT ({})'.format(event.place),
            address=event.place,
        )
        return default_loc
    return Location.objects.get(pk=location_guess['pk'])


def get_org(event):
    scores = [fuzz.token_set_ratio(event.org, loc['name']) for loc in all_organizations]
    organizations = sorted(zip(scores, all_organizations), key=lambda d: d[0], reverse=True)
    best_score, organization_guess = organizations[0]
    if best_score != 100:
        print(">>>>> WARN: no organization match for event '{}' and org '{}'".format(
            event.name, event.org,
        ))
        default_org, _ = Organization.objects.get_or_create(
            name='COCOLARP_IMPORT ({})'.format(event.org),
        )
        return default_org
    return Organization.objects.get(pk=organization_guess['pk'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Inject events CSV into the SQL database.')
    parser.add_argument('filename', metavar='EVENTS_FILENAME', help='the input event filename')
    args = parser.parse_args()

    Event.objects.all().delete()
    events = [CsvEvent.parse(event) for event in read_csv_data(args.filename)]

    for event in events:
        organization = get_org(event)
        location = get_location(event)
        try:
            Event.objects.create(
                name=event.name,
                created_by=User.objects.first(),
                organization=organization,
                location=location,
                summary=event.descr,
                description=event.descr,
                external_url=event.url,
                price=event.price,
                npc_price=event.npc_price,
                start=event.start,
                event_format=event.duration,
                currency=event.currency,
            )
        except django.db.utils.IntegrityError as exc:
            print(">>>>> ERROR: event '{}' already exists".format(event.name))
        except django.db.utils.DataError as exc:
            print(">>>>> ERROR: invalid data with event '{}'".format(event.name))
