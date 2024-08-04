#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON4:
TASK1
Practice analyzing strings."""

import data
print data.SHAKESPEARE
li = []
for l in data.SHAKESPEARE.split("\n"):
    li.append(len(l))
MAXIMUM_WORDS = sorted(li, reverse = True)[0]
MINIMUM_WORDS = sorted(li)[0]
AVERAGE_WORDS = sum(li) / float(len(l))

la = []
count = 0
for a in data.SHAKESPEARE.split("\n"):
    la.append(a)
for i in la:
    if "Crispian" in i:
        count += 1
NUM_CRISPIAN = count
