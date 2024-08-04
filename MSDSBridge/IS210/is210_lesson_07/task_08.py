#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Dictionary Comprehension."""


from data import FRUIT

def get_cost_per_item(shoplist):
    
    """Returns Sum of individual items in a shopping list.

    Args:
    Dictionary list (DICT).

    Returns:
    Number: Returns string from FRUIT.data and its sum.

    Examples:
    >>> get_cost_per_item({'Lime': 12, 'Red Pear': 4, 'Peach': 24, 'Beet': 1})
    {'Lime': 7.08, 'Peach': 95.76, 'Red Pear': 9.96}
    """
    T = 0
    S = {}
    for k, v in shoplist.iteritems():
        if k in FRUIT.keys():
            T = v * FRUIT[k]
            S.update({k:T})
    return S

def get_total_cost(shoplist):

    """Returns Total some of a list.

    Args:
    Dictionary list (DICT).

    Returns:
    Number: Returns total tally of shopping list.

    Examples:
    >>> get_total_cost({'Lime': 12, 'Red Pear': 4, 'Peach': 24, 'Beet': 1})
    112.80000000000001
    """
    T = {}
    for k, v in shoplist.iteritems():
        T.update(get_cost_per_item({k: v}))      
    return sum(T.values())
