#!usr/bin/env python#
# -*- coding: utf-8 -*-
"""Adding and Removing keys"""

import data

CORRECTED = data.BANDS.copy()
CORRECTED['Dylan'] = {'Bob Dylan': ['vocals', 'guitar', 'harmonices']}
del CORRECTED['Van Halen']['David Lee Roth']
CORRECTED['Van Halen']['Sammy Hager'] = ['vocals']
