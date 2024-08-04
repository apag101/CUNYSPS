#!usr/bin/env python#
# -*- coding: utf-8 -*-
"""Even and Odds Function."""


import data

def evens_and_odds(numbers, show_evens=True):

    """Returns even or odd numbers.

    Args:
    numbers(numeric).
    show_even(boolean, Default = True).

    Returns:
    Number: Returns a new list object.

    Examples:
    >>> evens_and_odds([1, 2, 3, 4], show_evens=False)
    [1, 3]
    >>> evens_and_odds([1, 2, 3, 4], show_evens=True)
    [2, 4]
    """
    enum = [] 
    onum = []
    num = []
    for x in numbers:
        if  x % 2==0:
            enum.append(x)
        else:
            onum.append(x)
        if show_evens:
            num = enum
        else:
            num = onum
    return num
