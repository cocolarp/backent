#!/usr/bin/env python3

import argparse
import csv
import json

from models import Place


def read_csv_data(filename):
    with open(filename, newline='') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        return [row for row in reader]


def import_places(data):
    places = [Place.parse(line) for line in data]
    for place in places:
        place.locate()
    for place in places:
        if place.lat is not None:
            print(json.dumps(place.as_dict()))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Turn CSV raw data into proper JSON with details.')
    parser.add_argument('filename', metavar='FILENAME', help='the input filename')
    parser.add_argument(
        '--type',
        default='places',
        const='places',
        nargs='?',
        choices=['places', 'organizers', 'events'],
        help='the type of import'
    )
    args = parser.parse_args()

    data = read_csv_data(args.filename)

    if args.type == 'places':
        import_places(data)
