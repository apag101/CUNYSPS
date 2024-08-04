#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Lesson 5 Task 01."""


def bool_to_str(bvalue, short=False):

    """Returns a boolean as a string.

    Args:
    bvalue(boolean, optional).
    short(bolean, Default : False).

    Returns:
    string: Returns a string value of Yes/No/Y/N

    Examples:
    >>> task_01.bool_to_str(False)
    'No'
    >>> task_01.bool_to_str(True, short=True)
    'Y'
    """
    ret = ""
    if bvalue and short:
        ret = "Y"
    elif bvalue and short is False:
        ret = "Yes"
    elif bvalue is False and short:
        ret = "N"
    else:
        ret = "No"
    return ret
