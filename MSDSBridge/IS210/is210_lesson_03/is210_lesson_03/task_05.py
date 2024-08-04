#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""LESSON3:
TASK5
Compound Examples."""

NAME = raw_input('What is your name ?')
P = raw_input('What is the principal amount ?')
t = raw_input('How many years is the loan ?')
Q = raw_input('Are you pre-qualified ? (Yes or No)').lower()
n = 12
r = 0

if int(P) < 200000:
    if int(t) < 16:
        r = .0363 if Q == 'yes' else .0465
    if int(t) > 15 < 21:
        r = .0404 if Q == 'yes' else .0498
    if int(t) > 20 < 31:
        r = .0577 if Q == 'yes' else .0639
if int(P) > 200000 < 1000000:
    if int(t) < 16:
        r = .0302 if Q == 'yes' else .0398
    if int(t) > 15 < 21:
        r = .0327 if Q == 'yes' else .0408
    if int(t) > 20 < 31 and Q == 'yes':
        r = .0466
if int(P) > 1000000:
    if int(t) < 16 and Q == 'yes':
        r = .0205
    if int(t) > 15 < 21 and Q == 'yes':
        r = .0262

TOTAL = int(round(int(P) * ( 1 + r / n) ** (n * int(t)),0))
REPORT = '''Loan Report For: {n}
-----------------------------
    Principal:      {p} 
    Duration:       {T}
    Prequalified?:  {q}
    Total:          {t}'''.format(n=NAME,p=P, T=t, q=Q, t=TOTAL)
print REPORT
