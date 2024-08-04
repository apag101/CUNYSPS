#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Lesson 08 Task 03 Creat a Simple Class"""

import time

class Snapshot():
    """A Snapshot definition.

    Args:
        created (timestamp): Time in Unix Timestamp
    """
    def __init__(self, created):
        self.created = time.time()
        

