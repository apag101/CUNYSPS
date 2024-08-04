#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON4:
TASK2
Practice prompting inside a loop."""

import data
ACCESS = False
COUNT = 0
TRACK = [3, 2, 1]

while ACCESS == 0:
    MSG = "What is your PASSWORD ({0} attempts left)?"
    P = raw_input(msg.format(TRACK[COUNT]))
    if P not in data.PASSWORD:
        COUNT += 1
        if COUNT > 2:
            print "Access is denied, please try again later."
            break
    else:
        ACCESS == True
