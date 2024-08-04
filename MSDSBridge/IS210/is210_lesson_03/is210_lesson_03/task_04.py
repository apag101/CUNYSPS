#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON3:
TASK4
Ternary Expressions."""


WEEKEND = ['saturday', 'sunday'] 
TIME = raw_input('Enter time as a 4 digit number. EG(0600)')
DAY = raw_input('What day of the week is it ?').lower()
SNOOZE = True if DAY in WEEKEND or TIME < 0600 else False

if SNOOZE == True:
    print ''
else:
    print 'Beep! Beep! Beep! Beep! Beep!'
