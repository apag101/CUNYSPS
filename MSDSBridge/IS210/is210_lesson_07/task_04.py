#!usr/bin/env python#
# -*- coding: utf-8 -*-
"""Changing the Value of a Key"""

import data

D = data.BANDS.copy()
D['Buckingham Nicks'] ={
		'Lindsey Buckingham': ['guitar', 'vocals'],
		'Stevie Nicks': ['vocals', 'tambourine']
		}
D['Fleetwood Mac'].update(D['Buckingham Nicks'])
