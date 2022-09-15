from sqlalchemy import Integer, Table,Column,String
from config.db import meta,engine

notifications = Table('notifications',meta,
Column('not_id',Integer,primary_key=True),
Column('username',String(255)),
Column('prod_name',Integer)),
Column('user_id',Integer)

meta.create_all(engine)