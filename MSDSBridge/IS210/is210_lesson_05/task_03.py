#!usr/bin/env python
# -*- coding: utf-8 -*-
"""Lesson 5 Task 03 Transforming Data."""


def celsius_to_fahrenheit(temperature):

    """Converts Celsius temperature to Fahrenheit.

    Args:
    temperature(numeric).

    Returns:
    Float: Returns a fahrenheit temperature in float

    Examples:
    >>> celsius_to_fahrenheit(42)
    107.6
    """
    F = 9 * float(temperature) / 5 + 32
    return float(F)

def fahrenheit_to_celsius(temperature):

    """Converts Fahrenheith temperature to celsius.

    Args:
    temperature(numeric).

    Returns:
    Float: Returns a celsius temperature in float

    Examples:
    >>> fahrenheit_to_celsius(42)
    5.555555555555555
    """
    C = 5 * (float(temperature) - 32) / 9
    return float(C)

def convert_temperature(temperature, output_format='c'):

    """Detects temperature and output specific type.

    Args:
    temperature(string).
    output_format(string).

    Returns:
    Float: Returns a numeric temperature

    Examples:
    >>> convert_temperature('42C', 'f')
    107.6
    >>> convert_temperature('42c')
    42.0
    >>> convert_temperature('42C', 'f')
    107.6
    >>> convert_temperature('107.6F', 'f')
    107.6
    """
    tl = len(str(temperature))
    ct = temperature[tl - 1].upper()
    temp = float(temperature[0:tl - 1])
    if ct == 'F' and output_format == 'c':
        t = fahrenheit_to_celsius(temp)
    elif ct == 'F' and output_format == 'f':
        t = temp
    elif ct == 'C' and output_format == 'f':
        t = celsius_to_fahrenheit(temp)
    elif ct == 'C' and output_format == 'c':
        t = temp
    else: t = None
    return t
