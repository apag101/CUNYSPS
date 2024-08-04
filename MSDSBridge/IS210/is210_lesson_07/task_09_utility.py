#!usr/bin/env python
# -*- coding: utf-8 -*-
""" Lesson 06 Helper Utilities """

import os
import csv


def get_data(file_name):
    """
    Helper function for retrieving data from CSV example files

    :param file_name:
    :return: list
    """
    data = []
    my_path = os.path.dirname(os.path.realpath(__file__))
    with open(os.path.join(my_path, file_name), 'r') as file_obj:
        reader = csv.reader(file_obj, delimiter=',')
        for row in reader:
            data.append(
                {
                    'clock': row[0],
                    'num': row[1],
                    'value_min': row[2],
                    'value_avg': row[3],
                    'value_max': row[4]
                }
            )
    return data


def sort_dict(dict_obj):
    """
    Simple way to take a dict and sort it into a list

    :param dict_obj:
    :return: list
    """
    output = []
    for k in sorted(dict_obj.iterkeys()):
        output.append(dict_obj[k])
    return output
