#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Dictionary Comprehension."""


import task_09_utility
DATA_FILES = {
        'data': {
            'task_09_data/router_01.csv',
            'task_09_data/router_02.csv',
            'task_09_data/router_03.csv',
            }
    }

def load_data(DATA_FILES):
    
    """Returns a dictionary from list of files.

    Args:
    Dictionary list (DICT).

    Returns:
    String: Returns string list of files as a dictionary.

    Examples:
    
    """
    c = 1
    i = {}
    d = {}
    for k,v in DATA_FILES.iteritems():
        i = task_09_utility.get_data(v)
        d.update({c:v})
        c += 1
    return d
    


    """Returns Total some of a list.

    Args:
    Dictionary list (DICT).

    Returns:
    Number: Returns total tally of shopping list.

    Examples:
    >>> get_total_cost({'Lime': 12, 'Red Pear': 4, 'Peach': 24, 'Beet': 1})
    112.80000000000001
    """

