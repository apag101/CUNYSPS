#!usr/bin/env python
# -*- coding: utf-8 -*-
"""Provides loan management features."""


import decimal

def get_interest_rate(principal, duration, prequalification):

    """Returns interest rate or None if none exists.

    Args:
    principal(numeric).
    duration(numberic).
    prequalification(boolean).

    Returns:
    Decimal: Returns a decimal interest

    Examples:
    >>> task_02.get_interest_rate(1000000, 15, True)
    '0.0205'
    """
    rate = None
    if principal >= 0 and principal <= 199999:
        if duration >= 1 and duration <= 15:
            if prequalification:
                rate = '0.0363'
            else:
                rate = '0.0465'
        elif duration >= 16 and duration <= 20:
            if prequalification:
                rate = '0.0404'
            else:
                rate = '0.0498'
        elif duration >= 21 and duration <= 30:
            if prequalification:
                rate = '0.0577'
            else:
                rate = '0.0639'
    elif principal >= 200000 and principal <= 999999:
        if duration >= 1 and duration <= 15:
            if prequalification:
                rate = '0.0302'
            else:
                rate = '0.0398'
        elif duration >= 16 and duration <= 20:
            if prequalification:
                rate = '0.0327'
            else:
                rate = '0.0408'
        elif duration >= 21 and duration <= 30:
            if prequalification:
                rate = '0.0466'
    elif principal >= 1000000:
        if duration >= 1 and duration <= 15:
            if prequalification:
                rate = '0.0205'
        elif duration >= 16 and duration <= 20:
            if prequalification:
                rate = '0.0262'
    else:
        rate = None
        if rate is not None:
            rate = decimal.Decimal(rate)
        else:
            rate = None
    return rate

def compound_interest(principal, duration, rate, interval=12):

    """Returns interest and principal combined.

    Args:
    principal(numeric).
    duration(numberic).
    rate(Decimal)
    interval(numeric, Default: 12)

    Returns:
    Integer: Returns an integer interest and principal combined.


    Examples:
    >>> task_02.compound_interest(1000000, 15, True)
    Decimal('1807919656619.745219860645100')
    """
    if rate is not None:
        rate = decimal.Decimal(rate)
        compound = principal * ((1 + rate / interval) ** (interval * duration))
    else: compound = None
    compound = decimal.Decimal(compound)
    return compound

def calculate_total(principal, duration, prequalification):

    """Returns the total, rounded to the nearest integer.

    Args:
    principal(numeric).
    duration(numberic).
    prequalification(boolean).

    Returns:
    Integer: Returns total to the nearest integer.


    Examples:
    >>> task_02.calculate_total(100000, 15, True)
    172233
    """
    rate = get_interest_rate(principal, duration, prequalification)
    total = int(compound_interest(principal, duration, rate, interval=12))
    return total

def calculate_interest(principal, duration, prequalification):

    """Returns the total interest.

    Args:
    principal(numeric).
    duration(numberic).
    prequalification(boolean).

    Returns:
    Integer: Returns total interest.

    Examples:
    >>> task_02.calculate_interest(100000, 15, True)
    72233
    """
    total = int(calculate_total(principal, duration, prequalification))
    interest = total - principal
    return interest
