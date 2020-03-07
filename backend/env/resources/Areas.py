from flask_restful import Resource
from flask import request
from models import db, Area
import random
import string

class Areas(Resource):

    def get(self):
        areas = Area.query.all()
        area_list = []
        for i in range(0,len(areas)):
            area_list.append(areas[i].serialize())
        return area_list, 200

    def post(self):
        json_data = request.get_json(force=True)
        if not json_data:
            return { "message" : "No input data provided"}, 400 
        area = Area.query.filter_by(county=json_data['county']).first()
        if area:
            if json_data["infected"] != -1:
                area.infected = json_data["infected"]
            if json_data["dead"] != -1:
                area.dead = json_data["dead"]
            if json_data["recovered"] != -1:
                area.recovered = json_data["recovered"]

            db.session.add(area)
            db.session.commit()
            result = Area.serialize(area)
            return { "status": 'success', 'data': result }, 201

        area = Area(
            id = json_data["id"],
            county = json_data["county"],
            infected = json_data["infected"],
            dead = json_data["dead"],
            recovered = json_data["recovered"]
        )
        
        db.session.add(area)
        db.session.commit()
        result = Area.serialize(area)
        return { "status": 'success', 'data': result }, 201
