from flask import Blueprint
from flask_restful import Api
from resources.Register import Register
from resources.Areas import Areas
from resources.Posts import Posts




api_bp = Blueprint('api', __name__)
api = Api(api_bp)

# Route
api.add_resource(Register, '/register')
api.add_resource(Areas, '/areas')
api.add_resource(Posts, '/posts')

