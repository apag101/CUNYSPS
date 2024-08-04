# -*- coding: utf-8 -*-
"""
Created on Sun Mar 31 14:24:03 2019

@author: apagan
"""

from flask import Flask
app = Flask(__name__)


@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello_world():
    return 'Hello, World!'

@app.route('/user/<username>')
def show_user_profile(username):
    return 'User %s' % username

@app.route('/post/<int:post_id>')
def show_post(post_id):
    return 'Post %d' % post_id

@app.route('/path/<path:subpath>')
def show_subpath(subpath):
    return 'Subpath %s' % subpath

@app.route('/project/')
def project():
    return 'The Project Page'

@app.route('/about')
def about():
    return 'The about page'
