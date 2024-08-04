#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON3:
TASK4
Ternary Expressions."""


WEEKEND = ['saturday', 'sunday']
DAY = raw_input('What day of the week is it ?').lower()
TIME = int(raw_input('Enter time as a 4 digit number. EG(0600)'))

SNOOZE = True if DAY[0:3] in WEEKEND[0] or DAY[0:3] in WEEKEND[1] \
         or TIME < 600 else False

if SNOOZE is not True:
    print 'Beep! Beep! Beep! Beep! Beep!'
