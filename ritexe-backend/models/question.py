from sqlalchemy import Integer, Table,Column,String,DateTime
from config.db import meta,engine

questions = Table('question',meta,
Column('qs_id',Integer,primary_key=True),
Column('qs_title',String(255)),
Column('qs_desc',String(255)),
# Column('date',DateTime)
)

meta.create_all(engine)