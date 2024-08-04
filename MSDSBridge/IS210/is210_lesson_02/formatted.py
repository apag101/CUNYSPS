#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Provides variables for formatting."""


FNAME = 'Pat'
NTYPE = '*amazing*'
RNUM = 42
NEWS = 'Hi {friend}! I have {0} news! I won the raffle with number {1:06.0f}!'
EMAIL = NEWS.format(NTYPE, RNUM, friend=FNAME)
