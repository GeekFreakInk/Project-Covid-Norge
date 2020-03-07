from flask import Flask
from marshmallow import Schema, fields, pre_load, validate
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

ma = Marshmallow()
db = SQLAlchemy()

class User(db.Model):

    __tablename__ = 'users'
    
    id = db.Column(db.String(), primary_key=True)
    userName = db.Column(db.String(), unique=True)
    isAdmin = db.Column(db.Boolean(), default=False)

    def __init__(self, id, userName, isAdmin):
        self.id = id,
        self.userName = userName
        self.isAdmin = isAdmin

    def __repr__(self):
        return "<id {}>".format(self.id)
    
    def serialize(self):
        return{
            "id" : self.id,
            "userName" : self.userName,
            "isAdmin" : self.isAdmin
        }
    

class Area(db.Model):

    __tablename__ = 'areas'
    
    id = db.Column(db.Integer(), primary_key=True,)
    county = db.Column(db.String())
    infected = db.Column(db.Integer(), default=0)
    dead = db.Column(db.Integer(), default=0)
    recovered = db.Column(db.Integer(), default=0)

    def __init__(self, id, county, infected, dead, recovered):
        self.id = id
        self.county = county
        self.infected = infected
        self.dead = dead
        self.recovered = recovered

    def __repr__(self):
        return "<id {}>".format(self.id)
    
    def serialize(self):
        return{
            "id" : self.id,
            "county" : self.county,
            "infected" : self.infected,
            "dead" : self.dead,
            "recovered" : self.recovered
        }
    

class Post(db.Model):
    __tablename__ = 'posts'
    
    id = db.Column(db.Integer(), primary_key=True)
    comment = db.Column(db.Text())
    posted = db.Column(db.Text())

    def __init__(self, id, comment, posted):
        self.id = id
        self.comment = comment
        self.posted = posted

    def __repr__(self):
        return "<id {}>".format(self.id)


    def serialize(self):
        return{
            "id" : self.id,
            "comment" : self.comment,
            "posted" : self.posted,
        }
        

   

   

    
    
    