# -*- coding: utf-8 -*-
"""
Created on Sat May  4 11:38:44 2019

@author: apagan
"""

import mysql.connector as mc 
print(mc.__version__) 
connection = mc.connect(user='root', password='123456',
host='127.0.0.1', database='sys',

auth_plugin='mysql_native_password')

