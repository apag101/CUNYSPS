# -*- coding: utf-8 -*-
"""
Created on Tue Oct 22 11:48:47 2019

@author: apagan
"""
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#Part 1 What proportion of trees are in good, fair, or poor health according to the ‘health’ variable?

rcount = 'https://data.cityofnewyork.us/resource/uvpi-gqnh.json?$select=count(tree_id)'
soql_rcount = pd.read_json(rcount)
url = 'https://data.cityofnewyork.us/resource/uvpi-gqnh.json?'
trees = pd.read_json(url)
trees.head(10)
trees.shape
soql_url = (url +\
        '$select=health,count(tree_id) as TreeCount, count(tree_id)/' + str(soql_rcount.iat[0,0]) + '* 100 as Percent' +\
        '&$where=health in("Fair", "Good", "Poor")' +\
        '&$group=health').replace(' ', '%20')
soql_trees = pd.read_json(soql_url)
soql_trees

labels = soql_trees.health
sizes = soql_trees.Percent
colors = ['gold', 'yellowgreen', 'lightcoral', 'lightskyblue']

# Plot
plt.pie(sizes, labels=labels, colors=colors,
autopct='%1.1f%%', shadow=True, startangle=140)

plt.axis('equal')
plt.show()

#Part 2 Are stewards (steward activity measured by the ‘steward’ variable) having an impact on the health of trees?
