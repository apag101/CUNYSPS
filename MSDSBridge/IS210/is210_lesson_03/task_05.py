#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON3:
TASK5
Compound Examples."""
import decimal
NAME = raw_input('What is your name ?')
P = int(raw_input('What is the principal amount ?'))
T = int(raw_input('How many years is the loan ?'))
Q = raw_input('Are you pre-qualified ? (Yes or No)').lower()
N = 12
R = 0
TOTAL = None

if P > 0 and P <= 199999:
    if T >= 1 and T <= 15:
        R = .0363 if Q == 'y' else .0465
    if T >= 16 and T <= 20:
        R = .0404 if Q == 'y' else .0498
    if T >= 21 and T <= 30:
        R = .0577 if Q == 'y' else .0639
if P >= 200000 and P <= 999999:
    if T >= 1 and T <= 15:
        R = .0302 if Q == 'y' else .0398
    if T >= 16 and T <= 20:
        R = .0327 if Q == 'y' else .0408
    if T >= 21 and T <= 30 and Q == 'y':
        R = .0466
if P >= 1000000:
    if T <= 15 and Q == 'y':
        R = .0205
    if T >= 16 and T <= 20 and Q == 'y':
        R = .0262

TOTAL = int(round(P * (1 + decimal.Decimal(str(R)) / N) ** (N * T), 0))

REPORT = '''Loan Report For: {n}
-----------------------------
    Principal:      {pr} 
    Duration:       {Time}
    Prequalified?:  {q}
    Total:          {total}'''.format(n=NAME, pr=P, Time=T, q=Q, total=TOTAL)
print REPORT
