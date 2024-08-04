# -*- coding: utf-8 -*-
"""
Created on Tue Oct 22 15:12:01 2019

@author: apagan
"""

import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd
import plotly.graph_objs as go
import dash_table
from dash.dependencies import Input, Output
import chart_studio
chart_studio.tools.set_credentials_file(username='ap00442', api_key='VZzkHCCz4SglHK5lcwvd')

#Part 1 What proportion of trees are in good, fair, or poor health according to the ‘health’ variable?

rcount = 'https://data.cityofnewyork.us/resource/uvpi-gqnh.json?$select=count(tree_id)'
soql_rcount = pd.read_json(rcount)
url = 'https://data.cityofnewyork.us/resource/uvpi-gqnh.json?'
trees = pd.read_json(url)
trees.head(10)
trees.shape
soql_url = (url +\
        '$select=boroname,health,steward,spc_common,count(tree_id) as TreeCount, count(tree_id)/' + str(round(soql_rcount.iat[0,0]* 100,2))+' as Percent' +\
        '&$where=health in("Fair", "Good", "Poor")' +\
        '&$group=boroname,health,steward,spc_common').replace(' ', '%20')
soql_trees = pd.read_json(soql_url)

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

boros = soql_trees['boroname'].unique()
health = soql_trees['health'].unique()
species = soql_trees['spc_common'].unique()
steward = soql_trees['steward'].unique()

app.layout = html.Div(children=[
        html.H1(children='Trees Dashboard'),

    html.H4(children='''
        Dash: Display Trees by Health
    '''),      

        html.Div([
            dcc.Dropdown(id='boros-xaxis-column',
                options=[{'label': i, 'value': i} for i in boros],
                value='Bronx'
    ),
            dcc.Dropdown(id='steward-xaxis-column',
                options=[{'label': i, 'value': i} for i in steward],
                value='None'
            ),
            
            dcc.Dropdown(id='species-xaxis-column',
                options=[{'label': i, 'value': i} for i in species],
                value='holly'
                
            ),], style={'display': 'inline-block', 'width': '60%'}),  
               
        html.Div([
            dcc.Graph(id='tree-graph',
            figure={'data': [go.Pie(labels=soql_trees.health, values = soql_trees.Percent)],
                    'layout':  go.Layout(title='Percent Health State',autosize=True)
            }      
            )], style={'width': '70%', 'float': 'right', 'display': 'inline-block'}),
    
    html.Div(dash_table.DataTable(
    id='table',
    columns=[{"name": i, "id": i} for i in soql_trees.columns[1:]],
    data= soql_trees.to_dict('records'),
    style_cell={'textAlign': 'left'},
    
    )),
           
])
   
@app.callback(
    Output('tree-graph', 'figure'),
    [Input('boros-xaxis-column', 'value'),
    Input('steward-xaxis-column', 'value'),
    Input('species-xaxis-column', 'value')])


def update_percent(boros, steward, species):
    df = soql_trees[(soql_trees.boroname == boros) & (soql_trees.steward == steward) & (soql_trees.spc_common == species)]
    da = df.groupby('health').agg({'Percent':'sum'})    
    return {'data': [go.Pie(labels = df.health.unique(), values = da.Percent*100)]}


@app.callback(
    Output(component_id='table', component_property = 'data'),
    [Input(component_id='boros-xaxis-column', component_property ='value'),
    Input(component_id='steward-xaxis-column', component_property ='value'),
    Input(component_id='species-xaxis-column', component_property ='value')])
    
def update_data(boros, steward, species):
    return soql_trees[(soql_trees.boroname == boros) & (soql_trees.steward == steward) & (soql_trees.spc_common == species)].to_dict('records')
 
    

if __name__ == '__main__':
    app.run_server(debug=True)