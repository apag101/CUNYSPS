#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Lesson 08, Task 02 file"""


class Car(object):
    """A moving vehicle definition.

    Args:
        color (string): The color of the car. Defaults to ``'red'``.
        tires (string): The type of tires. Defaults to None.

    Attributes:
       color (string): The color of the car.
       tires (string): The type of tires.
    """

    def __init__(self, color='red', tires=None):
        self.color = color
        self.tires = tires

        if tires is None:
            t = []
            a = Tire()
            b = Tire(1)
            c = Tire(2)
            d = Tire(3)
            t.append([a.miles, b.miles, c.miles, d.miles])
            

class Tire(object):
    """A round rubber thing.

    Args:
        miles (integer): The number of miles on the Tire. Defaults to 0.
        __maximum_miles(interger: The maximum miles. Defaults to 500.

    Attributes:
       miles (integer): The number of miles on the Tire.
       __maximum_miles: The maximum miles.
    """
    def __init__(self, miles=0, __maximum_miles=500):
        self.miles = miles
        self.__maximum_miles = __maximum_miless

    def add_miles(self, miles):
        """Increments the tire mileage by the specified miles.

        Args:
            miles (integer): The number of miles to add to the tire.
        """
        self.miles += miles
