import os

# You need to replace the next values with the appropriate values for your configuration

basedir = os.path.abspath(os.path.dirname(__file__))
SQLALCHEMY_ECHO = False
SQLALCHEMY_TRACK_MODIFICATIONS = True
SQLALCHEMY_DATABASE_URI = "postgres://jkptgntisvmjhs:a68580b5112380930685c5019322b9c910910e86ff5f8e3ade7bfd3fbcfdf327@ec2-46-137-177-160.eu-west-1.compute.amazonaws.com:5432/d5afjca70gfk54"