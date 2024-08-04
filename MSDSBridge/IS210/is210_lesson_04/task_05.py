\#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON4:
TASK5
Practice create versus Matchups."""

import data
MATCHUPS = ("")
ALLM = []
C = 1

for ROW_INDEX, ROW_NAME in enumerate(data.VERSUS):
    for COLUMN_INDEX, COLUMN_NAME in enumerate(data.VERSUS):
        if ROW_INDEX > COLUMN_INDEX:
            MSG = "{0}, {1}, {2}\n"
            ALLM.append(MSG.format(C, ROW_NAME, COLUMN_NAME).strip())
            C += 1
            MATCHUPS = tuple(ALLM)
        else:
            break
