#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON4:
TASK3
Practice looping math calculations."""

import data
S = []
for d in data.TRANSACTIONS:
    S += [sum(d)]
TOTAL = sum(S)
MINIMUM = min(S)
MAXIMUM = max(S)
