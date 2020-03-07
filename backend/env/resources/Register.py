from flask_restful import Resource
from flask import request
from models import db, User
import random
import string

class Register(Resource):

    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(0,len(users)):
            user_list.append(users[i].serialize())
        return {"status": str(user_list)}, 200
    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return { "message" : "No input data provided"}, 400 
        user = User.query.filter_by(id=json_data['id']).first()
        if user:
            return {'message': 'User already exists'}, 400
        user = User(
            id = json_data["id"],
            userName=json_data["userName"],
            isAdmin=json_data["isAdmin"]
        )
        
        db.session.add(user)
        db.session.commit()
        result = User.serialize(user)
        return { "status": 'success', 'data': result }, 201
        
        