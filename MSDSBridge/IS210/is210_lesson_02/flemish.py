#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Contains expectations."""


import inquisition

FISHY = inquisition.SPANISH.replace("surprise", "haddock")

INQ = len(inquisition.SPANISH)
FL1 = FISHY[0:FISHY.index("Spanish")] + "Flemish"
FL2 = FISHY[len(FL1): INQ]
FLEMISH = FL1 + FL2
