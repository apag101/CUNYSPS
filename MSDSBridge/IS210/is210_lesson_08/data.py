#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Starter data module"""


# Python libs
import time


class Produce(object):
    """A generic produce class.

    Stores the arrival time and estimated shelf-life of the produce.

    Args:
        arrival (numeric, optional): The time the produce arrived. Defaults to
            the current timestamp.

    Attributes:
        arrival (numeric): The time the produce arrived in a Unix timestamp.
        duration (numeric): The shelf life of the produce.
    """
    duration = 604800

    def __init__(self, arrival=None):
        if arrival is None:
            arrival = int(time.time())

        self.arrival = arrival

    def get_expiration(self):
        """Returns the expiration timestamp of the produce.

        Returns:
            integer: The expiration timestamp of the produce.

        Examples:

            >>> myprod = Produce(0)
            >>> myprod.get_expiration()
            604800
        """
        return self.arrival + self.duration

    def is_expired(self, checktime=None):
        """Returns whether or not the produce has exprired.

        Args:
            checktime (integer, optional): A unix timestamp to check. Defaults
            to the current timestamp.

        Returns:
            boolean: Returns ``True`` if it has already expired or ``False`` if
                not.

        Examples:

            >>> myprod = Produce()
            >>> myprod.is_expired()
            False

            >>> myprod = Produce(0)
            >>> myprod.is_expired()
            True
        """
        if checktime is None:
            checktime = int(time.time())
        return False if checktime < self.get_expiration else True
