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
chart_studio.tools.set_credentials_file(username='ap00442', api_key='cwjzo59tdeXqblNuXsBD')

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
        html.H1(children='Trees Dashboard: Display Trees by Health'),

    html.H4(children='''
        Dash: Select Borough and Steward
    '''),      

        html.Div([
            dcc.Dropdown(id='boros-xaxis-column',
                options=[{'label': i, 'value': i} for i in boros],
                value='Bronx'
    ),
            dcc.Dropdown(id='steward-xaxis-column',
                options=[{'label': i, 'value': i} for i in steward],
                value='None',
            )], style={'display': 'inline-block', 'width': '30%'}),  
               
        html.Div([
            dcc.Graph(id='tree-graph',
            figure={'data': [go.Pie(labels=soql_trees.health, values = soql_trees.Percent)],
                    'layout':  go.Layout(title='Percent Health State',
                                         margin={'l': 10, 'b': 30, 't': 30, 'r': 10})
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
    Input('steward-xaxis-column', 'value')])


def update_percent(boro, steward):
    df = soql_trees[(soql_trees.boroname == boro) & (soql_trees.steward == steward)]
    da = df.groupby('health').agg({'Percent':'sum'})    
    return {'data': [go.Pie(labels = df.health.unique(), values = da.Percent*100)]}


@app.callback(
    Output(component_id='table', component_property = 'data'),
    [Input(component_id='boros-xaxis-column', component_property ='value'),
    Input(component_id='steward-xaxis-column', component_property ='value')])
    
def update_data(boro, steward):
    return soql_trees[(soql_trees.boroname == boro) & (soql_trees.steward == steward)].to_dict('records')


if __name__ == '__main__':
    app.run_server(debug=True)