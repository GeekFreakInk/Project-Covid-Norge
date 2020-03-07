from flask_restful import Resource
from sqlalchemy.testing.config import db


class Post(Resource):

    __tablename__ = 'posts'
    __table_args__ = tuple(db.uniqueConstraint("id", "comment_id", name = "my_2uniq"))
    
      
    id = db.Column(db.Integer(), primary_key=True)
    comment = db.Column(db.Text())
    posted = db.Column(db.String())

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
        
    def get(self):
        comments = Post.query.all()
        comment_list = []
        for i in range(0,len(comments)):
            comment_list.append(comments[i].serialize())
        return {"status": str(comment_list)}, 200


   

   

    
    
    