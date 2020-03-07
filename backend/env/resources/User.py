from flask_restful import Resource
from sqlalchemy.testing.config import db


class User(Resource):

    __tablename__ = 'users'
    __table_args__ = tuple(db.uniqueConstraint("id", "username", name = "my_2uniq"))
    
    id = db.Column(db.String(), primary_key=True)
    userName = db.Column(db.String(), unique=True)
    isAdmin = db.Column(db.Boolean(), default=False)

    def __init__(self, id, userName, isAdmin):
        self.id = id
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
        
    def get(self):
        users = User.query.all()
        user_list = []
        for i in range(0,len(users)):
            user_list.append(users[i].serialize())
        return {"status": str(user_list)}, 200

