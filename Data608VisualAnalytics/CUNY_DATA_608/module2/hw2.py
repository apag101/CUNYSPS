# -*- coding: utf-8 -*-
"""
Created on Sat Sep 28 20:50:51 2019

@author: apagan
"""

import datashader as ds
import datashader.transfer_functions as tf
import datashader.glyphs
from datashader import reductions
from datashader.core import bypixel
from datashader.utils import lnglat_to_meters as webm, export_image
from datashader.colors import colormap_select, Greys9, viridis, inferno
import copy


from pyproj import Proj, transform
import numpy as np
import pandas as pd
import urllib
import json
import datetime
import colorlover as cl

import plotly.offline as py
import plotly.graph_objs as go
from plotly import tools

from shapely.geometry import Point, Polygon, shape
# In order to get shapley, you'll need to run [pip install shapely.geometry] from your terminal

from functools import partial

from IPython.display import GeoJSON

py.init_notebook_mode()

# Code to read in v17, column names have been updated (without upper case letters) for v18

bk = pd.read_csv('nyc_pluto_17v1_1/PLUTO17v1.1/BK2017V11.csv')
bx = pd.read_csv('nyc_pluto_17v1_1/PLUTO17v1.1/BX2017V11.csv')
mn = pd.read_csv('nyc_pluto_17v1_1/PLUTO17v1.1/MN2017V11.csv')
qn = pd.read_csv('nyc_pluto_17v1_1/PLUTO17v1.1/QN2017V11.csv')
si = pd.read_csv('nyc_pluto_17v1_1/PLUTO17v1.1/SI2017V11.csv')

ny = pd.concat([bk, bx, mn, qn, si], ignore_index=True,sort=True)

#ny = pd.read_csv('nyc_pluto_17v1_1/pluto_18v2.csv')


# Getting rid of some outliers
ny = ny[(ny['YearBuilt'] > 1850) & (ny['YearBuilt'] < 2020) & (ny['NumFloors'] != 0)]

wgs84 = Proj("+proj=longlat +ellps=GRS80 +datum=NAD83 +no_defs")
nyli = Proj("+proj=lcc +lat_1=40.66666666666666 +lat_2=41.03333333333333 +lat_0=40.16666666666666 +lon_0=-74 +x_0=300000 +y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs")
ny['XCoord'] = 0.3048*ny['XCoord']
ny['YCoord'] = 0.3048*ny['YCoord']
ny['lon'], ny['lat'] = transform(nyli, wgs84, ny['XCoord'].values, ny['YCoord'].values)

ny = ny[(ny['lon'] < -60) & (ny['lon'] > -100) & (ny['lat'] < 60) & (ny['lat'] > 20)]

#Defining some helper functions for DataShader
background = "black"
export = partial(export_image, background = background, export_path="export")
cm = partial(colormap_select, reverse=(background!="black"))

ny.groupby(['YearBuilt','NumFloors'])['NumBldgs'].count()

ny.iloc['YearBuilt']

ny.groupby(['YearBuilt','NumFloors'])['NumFloors'].sum()
ny['NumFloors'].max()*.75

dict(start=ny['NumBldgs'].min(), end=ny['NumBldgs'].max(), size=200)
ny.groupby(['NumBldgs','NumFloors']).count()
ny['NumFloors'].min().round()
