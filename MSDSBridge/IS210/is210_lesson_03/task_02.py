#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON3:
TASK2
Practice simple branching."""

BP_STATUS = raw_input("What is your current blood pressure?")

if int(BP_STATUS) < 89:
    BP_STATUS = "Low"
elif int(BP_STATUS) >= 90 and int(BP_STATUS) <= 119:
    BP_STATUS = "Ideal"
elif int(BP_STATUS) >= 120 and int(BP_STATUS) <= 139:
    BP_STATUS = "Warning"
elif int(BP_STATUS) >= 140 and int(BP_STATUS) <= 159:
    BP_STATUS = "High"
elif int(BP_STATUS) >= 160:
    BP_STATUS = "Emergency"
print "Based on your input your BP status is {0}".format(BP_STATUS)
