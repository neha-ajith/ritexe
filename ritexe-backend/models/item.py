from sqlalchemy import Integer, Table,Column,String,DateTime
from config.db import meta,engine

items = Table('item',meta,
Column('item_id',Integer,primary_key=True),
Column('name',String(255)),
Column('quantity',Integer))
# Column('date',DateTime)


meta.create_all(engine)