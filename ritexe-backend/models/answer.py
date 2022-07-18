from sqlalchemy import Integer, Table,Column,String,DateTime
from config.db import meta,engine

answers = Table('answer',meta,
Column('ans_id',Integer,primary_key=True),
Column('ans',String(255)),
Column('upvote',Integer),
Column('downvote',Integer),)
# Column('date',DateTime)


meta.create_all(engine)