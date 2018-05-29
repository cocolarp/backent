import datetime
import os

import dateparser
from googleplaces import GooglePlaces
import pytz

from backent.api import models

API_KEY = os.environ.get('PLACES_API_KEY')

google = GooglePlaces(API_KEY)


class Place:
    def __init__(self, name, address, country, short_address=None, formatted_address=None, lat=None, lng=None):
        self.name = name
        self.address = address
        self.country = country
        self.formatted_address = formatted_address
        self.short_address = short_address
        self.lat = lat
        self.lng = lng

    def __str__(self):
        return "{}, {}, {}".format(self.country, self.name, self.address)

    def as_dict(self):
        return {
            'name': self.name,
            'address': self.address,
            'country': self.country,
            'formatted_address': self.formatted_address,
            'lat': self.lat,
            'lng': self.lng,
            'short_address': self.short_address,
        }

    @classmethod
    def parse(cls, line):
        items = line[1].split(',')
        try:
            place_name = items.pop(0).strip()
            country = items.pop().strip()
        except IndexError:
            print("pop failed on line: '{}'".format(line))
            raise
        return cls(place_name, ','.join(items).strip(), country)

    def locate(self):
        query_result = google.autocomplete(input=self.address)
        if len(query_result.predictions) == 0:
            print(">>>>> WARN place '{}' could not be found!".format(self.address))
            self.short_address = self.address.split(',')[-1].strip()
            query_result = google.autocomplete(input=self.short_address)
            if len(query_result.predictions) == 0:
                print(">>>>> ERROR short address '{}' could not be found!".format(self.short_address))
                return

        prediction = query_result.predictions[0]  # get first prediction
        prediction.get_details()
        self.formatted_address = prediction.place.formatted_address
        self.lat = float(prediction.place.geo_location['lat'])
        self.lng = float(prediction.place.geo_location['lng'])


def parse_price(s):
    if 'x' in s or '?' in s:
        return None, None
    if '€' in s:
        currency = models.CURRENCY_EUR
        s = s.replace('€', '')
    elif '$' in s:
        currency = models.CURRENCY_USD
        s = s.replace('$', '')
    else:
        print(">>>> ERROR: invalid amount:", s)
        return None, None
    return (int(s.strip()) * 100, currency)


def parse_duration(s):
    if s == 'Quelques heures':
        return models.EVENT_FORMAT_HOURS
    elif s == '2 ou 3 jours':
        return models.EVENT_FORMAT_MEDIUM
    elif s == 'Plus de 3 jours':
        return models.EVENT_FORMAT_LONG
    elif s == '1 journée':
        return models.EVENT_FORMAT_SHORT


class Event:

    def __init__(self, name, descr, url, currency, price, npc_price, start, duration, org, place):
        self.name = name
        self.descr = descr
        self.url = url
        self.currency = currency
        self.price = price
        self.npc_price = npc_price
        self.start = start
        self.duration = duration
        self.org = org
        self.place = place

    def __str__(self):
        return '{}, {}, {}, {}, {}, {}, {}'.format(
            self.name,
            self.currency,
            self.price,
            self.npc_price,
            self.start,
            self.duration,
            self.org,
        )

    @classmethod
    def parse(cls, line):
        amount, currency = parse_price(line[4])
        npc_amount, _ = parse_price(line[5])
        start = dateparser.parse(line[6]).replace(tzinfo=pytz.utc)
        return cls(
            name=line[0],
            org=line[1],
            descr=line[2],
            url=line[3],
            currency=currency or 'EUR',  # default currency
            price=amount or 0,  # price has to be known
            npc_price=npc_amount,
            start=start,
            duration=parse_duration(line[7]),
            place=line[10],
        )
