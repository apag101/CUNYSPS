#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON3:
TASK3 
Practice nested statements."""

PARENT = ['None', 'Seattle Gray', 'Manatee', 'Ceramic Glaze',
          'Culumus Nimbus', 'Platinum Mist', 'Spartan Sage']

NONE = ['Seattle Gray', 'Manatee']
SEATTLEGRAY = ['Ceramic Glaze', 'Culumus Nimbus']
MANATEE = ['Platinum Mist', 'Spartan Sage']
CERAMICGLAZE = ['Basically White', 'White']
CULUMUSNIMBUS = ['Off-White', 'Paper White']
PLATINUMMIST = ['Bone White', 'Just White']
SPARTANSAGE = ['Fractal White', 'Not White']

SELECTION = raw_input('Enter one of the following parent colors {0}'.format(PARENT))

if SELECTION == 'None':
    TYPE = 'Base'
    COLOR = raw_input('Enter one of the following colors {0}'.format(NONE))
    while True:
        if not COLOR in NONE: 
            print 'You have entered an invalid color'
            break
elif SELECTION == 'Seattle Gray':
    TYPE = 'Accent'
    COLOR = raw_input('Enter one of the following colors {0}'.format(SEATTLEGRAY))
    while True:
        if not COLOR in SEATTLEGRAY:
            print 'You have entered an invalid color'
            break
elif SELECTION == 'Manatee':
    TYPE = 'Accent'
    COLOR = raw_input('Enter one of the following colors {0}'.format(MANATEE))
    while True:
        if not COLOR in MANATEE:
            print 'You have entered an invalid color'
            break
elif SELECTION == 'Ceramic Glaze':
    TYPE = 'Highlight'
    COLOR = raw_input('Enter one of the following colors {0}'.format(CERAMICGLAZE))
    while True:
        if not COLOR in CERAMICGLAZE:
            print 'You have entered an invalid color'
            break
elif SELECTION == 'Culumus Nimbus':
    TYPE = 'Highlight'
    COLOR = raw_input('Enter one of the following colors {0}'.format(CULUMUSNIMBUS))
    while True:
        if not COLOR in CULUMUSNIMBUS:
            print 'You have entered an invalid color'
            break    
elif SELECTION == 'Platinum Mist':
    TYPE = 'Highlight'
    COLOR = raw_input('Enter one of the following colors {0}'.format(PLATINUMMIST))
    while True:
        if not COLOR in PLATINUMMIST:
            print 'You have entered an invalid color'
            break
elif SELECTION == 'Spartan Sage':
    TYPE = 'Highlight'
    COLOR = raw_input('Enter one of the following colors {0}'.format(SPARTANSAGE))
    while True:
        if not COLOR in SPARTANSAGE:
            print 'You have entered an invalid color'
            break
else:
    COLOR = 'INVALID'
    SELECTION = 'INVALID'
    TYPE = 'INVALID'
    print 'You have entered an invalid color'
print '{0}  has a parent color of {1} and a type of {2}'.format(COLOR, SELECTION, TYPE)
