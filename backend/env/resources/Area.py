from flask_restful import Resource
from sqlalchemy.testing.config import db


class Area(Resource):

    __tablename__ = 'areas'
    __table_args__ = tuple(db.uniqueConstraint("id","county", name = "my_2uniq"))
    
    id = db.Column(db.Integer(), primary_key=True)  
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
            "id": self.id,
            "county" : self.county,
            "infected" : self.infected,
            "dead" : self.dead,
            "recovered" : self.recovered
        }
        
    def get(self):
        area = Area.query.all()
        area_list = []
        for i in range(0,len(area)):
            area_list.append(area[i].serialize())
        return {"status": str(area_list)}, 200


   

   

    
    
    