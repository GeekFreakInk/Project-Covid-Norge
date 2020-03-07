from flask_restful import Resource
from flask import request
from models import db, Post
import random
import string

class Posts(Resource):

    def get(self):
        posts = Post.query.all()
        posts_list = []
        for i in range(0,len(posts)):
            posts_list.append(posts[i].serialize())
        return posts_list, 200
        

    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return { "message" : "No input data provided"}, 400 
        post = Post.query.filter_by(id=json_data['id']).first()
        if post:
            return {'message': 'Area already exists'}, 400
            
        post = Post(
            id = json_data["id"],
            comment = json_data["comment"],
            posted = json_data["posted"],
        )
        
        db.session.add(post)
        db.session.commit()
        result = Post.serialize(post)
        return { "status": 'success', 'data': result }, 201
        
        