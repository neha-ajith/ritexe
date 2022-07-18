from sqlalchemy import Integer, Table,Column,String
from config.db import meta,engine

users = Table('users',meta,
Column('id',Integer,primary_key=True),
Column('username',String(255)),
Column('name',String(255)),
Column('email',String(255)),
Column('password',String(255)),
Column('upVotes',Integer),
)

meta.create_all(engine)