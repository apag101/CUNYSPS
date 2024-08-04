#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON4:
TASK1
Practice analyzing strings."""

import data
print data.SHAKESPEARE
LI = []
W = []
for l in data.SHAKESPEARE.split("\n"):
    W.append("{0}".format(l).strip())
    for s in W:
        WO = s.split(" ")
        LI.append(len(WO))
MAXIMUM_WORDS = max(LI)
MINIMUM_WORDS = min(LI)
AVERAGE_WORDS = float(sum(LI)) / float(len(LI))

LA = []
COUNT = 0
for a in data.SHAKESPEARE.split("\n"):
    LA.append(a)
for i in LA:
    if "Crispian" in i:
        COUNT += 1
NUM_CRISPIAN = COUNT
