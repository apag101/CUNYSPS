#!usr/bin/env python#
# -*- coding: utf-8 -*-
"""Even and Odds Function."""

DATA = {
    1: 100,
    2: 200,
    3: 300,
    4: 400,
    5: 500,
    6: 600,
    7: 700,
    8: 800,
    9: 900,
    10: 1000
}

def iter_dict_funky_sum(D):
    
    """Returns Sum of a list.

    Args:
    key(numeric).

    Returns:
    Number: Returns sum as an integer.

    Examples:
    >>> task_07.iter_dict_funky_sum(task_07.DATA)
    5445
    """
    TOTAL = 0
    for k, v in D.iteritems():
        TOTAL = TOTAL + v - k
    return TOTAL
