#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Getting values witha Default"""


import data

SUPER_SIDEKICKS = {}
for HERO, HERO_DATA in data.SUPERHEROES.iteritems():
    SUPER_SIDEKICKS[HERO] = data.SUPERHEROES.get(HERO).get('pet')
